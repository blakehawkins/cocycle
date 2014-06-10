class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :route, index: true
      t.integer :start_time     # seconds since midnight

      t.timestamps
    end
  end
end
