class Customer < ApplicationRecord
  belongs_to :province
  belongs_to :city
  validates :name, :address, :phone_number, :email, presence: true
  validates :email, uniqueness: true
end
