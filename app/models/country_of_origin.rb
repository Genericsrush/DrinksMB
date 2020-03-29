class CountryOfOrigin < ApplicationRecord
  has_many :drinks
  validates :name, :abbreviation, presence: true
end
