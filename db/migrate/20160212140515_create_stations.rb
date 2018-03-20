class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :postal_code
      t.string :address
      t.string :opening_hours
      t.string :latitude
      t.string :longitude
      t.string :label
      t.integer :location_id
      t.integer :municipality_id
      t.integer :province_id
    end
    add_index :stations, [:label, :latitude, :longitude], unique: true
    add_index :stations, :label
    add_index :stations, [:latitude, :longitude]
    add_index :stations, :location_id
    add_index :stations, :municipality_id
    add_index :stations, :province_id
  end
end
