class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  has_many :likes

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  has_many :ingredient_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredient_recipes
  accepts_nested_attributes_for :ingredient_recipes, allow_destroy: true,
    reject_if: ->(record) { record[:ingredient_id].blank? }

  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  accepts_nested_attributes_for :recipe_tags, allow_destroy: true,
    reject_if: ->(record) { record[:tag_id].blank? }

  validates_presence_of :name, :description, :category_id
end
