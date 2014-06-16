class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :time, limit: 5

      t.timestamps
    end
  end
end
