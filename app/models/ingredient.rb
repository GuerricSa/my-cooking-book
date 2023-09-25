class Ingredient < ApplicationRecord
  has_many :compositions
  has_many :recipes, through: :compositions
end
