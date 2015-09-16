class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.text :street, null: false
      t.string :status, null: false
      t.integer :price, null: false
      t.integer :bedrooms, null: false
      t.integer :bathrooms, null: false
      t.integer :sq_ft, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps null: false
    end

    add_index :houses, [
      :street, :price, :bedrooms, :bathrooms,
      :sq_ft, :latitude, :longitude
    ], unique: true, name: "no_duplicate_records"
  end
end
