class Recipe < ApplicationRecord
  belongs_to :user

  has_many :compositions
  has_many :ingredients, through: :compositions
end
