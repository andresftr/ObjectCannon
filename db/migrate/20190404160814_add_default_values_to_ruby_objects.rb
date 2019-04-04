class AddDefaultValuesToRubyObjects < ActiveRecord::Migration[5.2]
  def change
    change_column :ruby_objects, :attacker, :integer, default: 1
  end
end
