class Order < ApplicationRecord
  has_many :drinks, through: :ordered_drink
end
