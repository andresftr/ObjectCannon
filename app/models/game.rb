# frozen_string_literal: true

# Here are the validations and other things related with the Game model
class Game < ApplicationRecord
  has_many :ruby_objects, dependent: :destroy
  validates :name, :rival, presence: true, length: { in: 3..25 }
  validate :different_names

  def different_names
    errors.add(:rival, "can't have the same name as player one") if name == rival
    throw(:abort)
  end
end
