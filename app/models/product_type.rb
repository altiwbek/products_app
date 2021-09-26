class ProductType < ApplicationRecord

  has_many :product_by_types, dependent: :destroy
  has_many :products, through: :product_by_types
  has_many :manufacturers, through: :products
end
