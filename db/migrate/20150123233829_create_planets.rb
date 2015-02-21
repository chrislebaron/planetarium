class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :position
      t.decimal :orbital_speed
      t.decimal :volume
      t.decimal :mass

      t.timestamps null: false
    end
  end
end
