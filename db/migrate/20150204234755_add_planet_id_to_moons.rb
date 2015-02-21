class AddPlanetIdToMoons < ActiveRecord::Migration
  def change
    add_column :moons, :planet_id, :integer
  end
end
