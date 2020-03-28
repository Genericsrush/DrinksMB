class Drink < ApplicationRecord
  has_many :orders, through: :ordered_drink
  belongs_to :country
end
