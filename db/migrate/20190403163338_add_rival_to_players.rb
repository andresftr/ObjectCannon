class AddRivalToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :rival, :string
    add_column :players, :hit_points_rival, :integer
  end
end
