class RenamePlayersToGames < ActiveRecord::Migration[5.2]
  def change
    rename_table :players, :games
  end
end
