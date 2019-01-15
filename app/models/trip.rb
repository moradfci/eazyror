class Trip < ApplicationRecord

has_many :Histories

  validates :start_long ,presence:true
  validates :start_lat ,presence:true

  validates :destination_long ,presence:true
  validates :destenation_lat ,presence:true

  validates :status ,presence:true
end
