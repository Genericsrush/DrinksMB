class Order < ApplicationRecord
  belongs_to :ordered_drink
  has_many :drink, through: :ordered_drink
end
