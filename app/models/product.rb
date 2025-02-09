class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantitiy, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
end
