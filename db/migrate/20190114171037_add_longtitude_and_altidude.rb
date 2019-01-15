class AddLongtitudeAndAltidude < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :start_long, :decimal
    add_column :trips, :start_lat, :decimal
    add_column :trips, :destination_long, :decimal
    add_column :trips, :destenation_lat, :decimal

  end
end
