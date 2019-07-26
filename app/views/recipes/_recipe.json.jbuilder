json.extract! recipe, :id, :name
json.created_at recipe.created_at.to_formatted_s(:long_ordinal)
json.description recipe.description[0..280].gsub(/\s\w+\s*$/, '...')
json.category recipe.category, :id, :name, :icon
json.image recipe.images.select(&:selected).first&.path
json.tags recipe.recipe_tags do |recipe_tag|
  json.id recipe_tag.id
  json.name recipe_tag.tag.name
end
json.with_user user_signed_in?
if liked[recipe.id].present?
  json.like_id liked[recipe.id].first[:like_id]
end
json.url recipe_url(recipe, format: :json)
