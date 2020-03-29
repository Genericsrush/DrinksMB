class Province < ApplicationRecord
  validates :name, presence: true
  validates :gst, :pst, :hst, presence:true, numericality: {only_float: true}
end
