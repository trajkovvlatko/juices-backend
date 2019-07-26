class Ingredient < ApplicationRecord
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

  validates_presence_of :name, :measurement
  validates_uniqueness_of :name
end
