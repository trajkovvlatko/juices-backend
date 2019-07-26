json.extract! @recipe, :id, :name, :description
json.category @recipe.category, :id, :name, :icon
json.images @recipe.images.sort_by{ |a| a.selected ? 0 : 1 }.map(&:path)

json.tags @recipe.recipe_tags do |recipe_tag|
  json.id recipe_tag.id
  json.name recipe_tag.tag.name
end

json.ingredients @recipe.ingredient_recipes do |ingredient_recipe|
  json.extract! ingredient_recipe.ingredient, :id, :name, :measurement
  json.amount ingredient_recipe.amount
end

json.url recipe_url(@recipe, format: :json)
