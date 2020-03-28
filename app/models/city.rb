class City < ApplicationRecord
  belongs_to :province
  has_many :customers

  validates :name, presence: true
end
