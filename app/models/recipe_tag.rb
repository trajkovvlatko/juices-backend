class RecipeTag < ApplicationRecord
  belongs_to :recipe, optional: true
  belongs_to :tag, optional: true

  accepts_nested_attributes_for :tag
end
