class AdminPanel::RecipesController < AdminPanel::HomeController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    @recipes = Recipe
      .select(:id, :name, :description, :category_id)
      .includes(:category)
      .paginate(page: page, per_page: per_page)
      .order(created_at: :desc)
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @categories = Category.all
    @tags = Tag.all
    @ingredients = Ingredient.all

    3.times { @recipe.images.build }
    5.times { @recipe.ingredient_recipes.build }
    3.times { @recipe.recipe_tags.build }
  end

  # GET /recipes/1/edit
  def edit
    @categories = Category.all
    @tags = Tag.all
    @ingredients = Ingredient.all
    @recipe.images.build
    @recipe.ingredient_recipes.build
    @recipe.recipe_tags.build
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to edit_admin_panel_recipe_path(@recipe), notice: 'Recipe was successfully created.' }
      else
        @categories = Category.all
        @tags = Tag.all
        @ingredients = Ingredient.all
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /recipes/1
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to edit_admin_panel_recipe_path(@recipe), notice: 'Recipe was successfully updated.' }
      else
        @categories = Category.all
        @tags = Tag.all
        @ingredients = Ingredient.all
        format.html { render :edit }
      end
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to admin_panel_recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe
        .includes(:category, :images, :recipe_tags, :tags, :ingredient_recipes,
                  :ingredients)
        .find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(
        :name,
        :description,
        :category_id,
        images_attributes: [:id, :path, :selected, :_destroy],
        ingredient_recipes_attributes: [:id, :amount, :ingredient_id,
                                        :_destroy],
        recipe_tags_attributes: [:id, :amount, :tag_id, :_destroy]
      )
    end
end
