
class Drink < ApplicationRecord
  #belongs_to :ordered_drink
  #has_many :orders, through: :ordered_drink
  belongs_to :country_of_origin
  validates :name, :description, :price_cents, presence: true
  validates :price_cents, :discount, numericality: true
  has_one_attached :image
end