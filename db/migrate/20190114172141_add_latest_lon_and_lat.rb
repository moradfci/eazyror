class AddLatestLonAndLat < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :latest_long, :decimal
    add_column :histories, :latest_lat, :decimal
  end
end
