class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :ccaa_id
    end
    add_index :provinces, :name
  end
end
