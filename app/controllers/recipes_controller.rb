class RecipesController < HomeController
  # GET /recipes.json
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    @liked = []
    if user_signed_in?
      @liked = current_user
        .likes.map { |like| { like_id: like.id,  recipe_id: like.recipe_id } }
        .group_by{ |like| like[:recipe_id] }
    end

    @recipes = Recipe
      .select(:id, :name, :description, :category_id, :created_at)
      .paginate(page: page, per_page: per_page)
      .includes(:category, :images, :recipe_tags, :tags)
      .order(created_at: :desc)
  end

  # GET /recipes/1.json
  def show
    @recipe = Recipe
      .includes(:category, :images, :recipe_tags, :tags, :ingredients)
      .find params[:id]
  end

  # GET /favorites.json
  def favorites
    page = params[:page] || 1
    per_page = params[:per_page] || 10

    @recipes = Recipe
      .select(:id, :name, :description, :category_id, :created_at, 'likes.id AS like_id')
      .joins(:likes)
      .where('likes.user_id = ?', current_user.id)
      .paginate(page: page, per_page: per_page)
      .includes(:category, :images, :recipe_tags, :tags)
      .order(created_at: :desc)
    @liked = @recipes
      .map { |recipe| { like_id: recipe.like_id, recipe_id: recipe.id } }
      .group_by{ |like| like[:recipe_id] }
    render 'recipes/index'
  end
end
