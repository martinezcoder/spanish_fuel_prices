class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :name
      t.integer :province_id
    end
    add_index :municipalities, :name
    add_index :municipalities, :province_id
  end
end
