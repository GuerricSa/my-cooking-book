class Ingredient < ApplicationRecord
  INGREDIENT_LIST = ["haricot vert", "frite", "steack"].freeze
  has_many :compositions
  has_many :recipes, through: :compositions

  validates :name, inclusion: { in: INGREDIENT_LIST }
end
