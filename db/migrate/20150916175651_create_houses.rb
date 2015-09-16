class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.text :street, null: false
      t.string :status, null: false
      t.integer :price, null: false
      t.integer :bedrooms, null: false
      t.integer :bathrooms, null: false
      t.integer :sq_ft, null: false
      t.decimal :latitude, precision: 16, scale: 15
      t.decimal :longitude, precision: 17, scale: 16
      t.timestamps null: false
    end
  end
end
