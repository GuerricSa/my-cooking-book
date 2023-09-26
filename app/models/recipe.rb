class Recipe < ApplicationRecord
  belongs_to :user

  has_many :compositions, dependent: :destroy
  has_many :ingredients, through: :compositions, dependent: :delete_all
  has_one_attached :photo
end
