class AddDefaultValuesToPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :hit_points, :integer, default: 100
    change_column :players, :hit_points_rival, :integer, default: 100
  end
end
