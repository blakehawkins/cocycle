class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.decimal :start_lat, precision: 9, scale: 6
      t.decimal :start_long, precision: 9, scale: 6
      t.decimal :finish_lat, precision: 9, scale: 6
      t.decimal :finish_long, precision: 9, scale: 6

      t.timestamps
    end
  end
end
