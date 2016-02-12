class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :postal_code
      t.string :address
      t.string :opening_hours
      t.float :latitude
      t.float :longitud
      t.string :location
      t.string :municipality
      t.string :province
      t.string :margin
      t.string :remission
      t.string :label
      t.string :sales_type
      t.integer :biodiesel
      t.integer :bioetanol
      t.integer :compressed_natural_gas
      t.integer :liquefied_natural_gas
      t.integer :a_diesel
      t.integer :gasoline_95
      t.integer :gasoline_98
      t.integer :new_a_diesel
      t.integer :bioetanol_per
      t.integer :methyl_ester_per

      t.timestamps null: false
    end
  end
end
