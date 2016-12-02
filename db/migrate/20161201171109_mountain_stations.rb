class MountainStations < ActiveRecord::Migration
  def change
    create_table :mountain_stations do |t|
      t.string :pws_id, null: false
      t.string :name, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
    end
  end
end
