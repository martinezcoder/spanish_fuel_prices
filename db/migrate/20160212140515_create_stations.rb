class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :postal_code
      t.string :address
      t.string :opening_hours
      t.integer :latitude
      t.integer :longitud
      t.string :label
    end
  end
end
