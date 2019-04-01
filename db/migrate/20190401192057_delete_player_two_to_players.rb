class DeletePlayerTwoToPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :player_two, :string
    rename_column :players, :player_one, :name
  end
end
