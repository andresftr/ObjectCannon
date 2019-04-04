class RemoveAttackedFromRubyObject < ActiveRecord::Migration[5.2]
  def change
    remove_column :ruby_objects, :attacked, :integer
  end
end
