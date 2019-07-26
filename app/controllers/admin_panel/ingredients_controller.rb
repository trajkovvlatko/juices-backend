class AdminPanel::IngredientsController < AdminPanel::HomeController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to admin_panel_ingredient_path(@ingredient), notice: 'Ingredient was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to admin_panel_ingredient_path(@ingredient), notice: 'Ingredient was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to admin_panel_ingredients_url, notice: 'Ingredient was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :measurement)
    end
end
