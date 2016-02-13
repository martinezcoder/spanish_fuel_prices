class CreateDayPrices < ActiveRecord::Migration
  def change
    create_table :day_prices do |t|
      t.integer :day
      t.integer :station_id
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
    end
    add_index :day_prices, [:day, :station_id], unique: true
    add_index :day_prices, :day
    add_index :day_prices, :station_id
  end
end
