class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :postcode, limit: 8
      t.decimal :lat, precision: 8, scale: 6
      t.decimal :long, precision: 9, scale: 6

      t.timestamps
    end
    add_index :locations, :postcode, unique: true
  end
end
