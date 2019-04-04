class CreateRubyObjects < ActiveRecord::Migration[5.2]
  def change
    create_table :ruby_objects do |t|
      t.integer :attacker
      t.integer :number_attributes
      t.integer :attacker
      t.integer :attacked
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
