class MountainStations < ActiveRecord::Migration
  def change
    create_table :mountain_stations do |t|
      t.string :pws_id, null: false
      t.string :name, null: false
    end
  end
end
