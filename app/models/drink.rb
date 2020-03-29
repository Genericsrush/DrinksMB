class Drink < ApplicationRecord
  has_many :orders, through: :ordered_drink
  belongs_to :country_of_origin
  validates :name, :description, :price, presence: true
end
