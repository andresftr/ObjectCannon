class AddPlayerTwoNameToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :player_two, :string
    rename_column :players, :name, :player_one
  end
end
