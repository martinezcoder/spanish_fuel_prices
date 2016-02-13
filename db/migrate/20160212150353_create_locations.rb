class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :municipality_id
    end
    add_index :locations, :name, unique: true
    add_index :locations, :municipality_id
  end
end
