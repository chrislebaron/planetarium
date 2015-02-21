class CreateMoons < ActiveRecord::Migration
  def change
    create_table :moons do |t|
      t.string :name
      t.boolean :atmosphere
      t.string :composition

      t.timestamps null: false
    end
  end
end
