class History < ApplicationRecord

  belongs_to :trip
  validates :trip_id ,presence:true
  validates :latest_long ,presence:true
  validates :latest_lat ,presence:true

end
