class Customer < ApplicationRecord
  belongs_to :province
  belongs_to :city
end
