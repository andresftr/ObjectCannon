class RemoveRivalFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :rival, :integer
  end
end
