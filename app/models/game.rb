class Game < ApplicationRecord
  has_many :ruby_objects
  validates :name, :rival, presence: true, length: { in: 3..20 }
  validate :different_names

  def different_names
    if name == rival
      errors.add(:rival, 'can not have the same name as player one')
    end
  end
end
