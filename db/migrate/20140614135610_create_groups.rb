class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :hour, :minute

      t.timestamps
    end
  end
end
