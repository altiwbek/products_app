class Manufacturer < ApplicationRecord
  has_many :products, dependent: :destroy
end
