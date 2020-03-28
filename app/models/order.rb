class Order < ApplicationRecord
  has_many :drink, through: :ordered_drink
end
