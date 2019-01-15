class AddTripIdToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :trip_id, :integer
  end
end
