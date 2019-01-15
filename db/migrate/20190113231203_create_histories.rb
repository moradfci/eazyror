class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :trip_id
      t.string :latest_location
      t.timestamps
    end
  end
end
