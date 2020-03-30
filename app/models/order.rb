class Order < ApplicationRecord
  belongs_to :ordered_drink
  has_many :drinks, through: :ordered_drink
  validates :total_cost, :gst, :pst, :hst, presence: true
  validates :total_cost, :gst, :pst, :hst, numericality: true
end
