# frozen_string_literal: true

# Here are the validations and other things related with the Game model
class Game < ApplicationRecord
  has_many :ruby_objects
  validates :name, :rival, presence: true, length: { in: 3..20 }
  validate :different_names

  def different_names
    errors.add(:rival, 'can not have the same name as player one') if name == rival
  end
end
