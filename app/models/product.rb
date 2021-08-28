class Product < ApplicationRecord

  has_one_attached :image

  belongs_to :manufacturer

  has_many :product_by_types, dependent: :destroy
  has_many :product_types, through: :product_by_types
end
