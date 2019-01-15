class ChangeAttrToTrips < ActiveRecord::Migration[5.1]
  def change

change_column :trips, :start_long, :decimal, :precision => 15, :scale => 10
change_column :trips, :start_lat, :decimal, :precision => 15, :scale => 10
change_column :trips, :destination_long, :decimal, :precision => 15, :scale => 10
change_column :trips, :destenation_lat, :decimal, :precision => 15, :scale => 10


  end
end
