class Game < ApplicationRecord
  has_many :ruby_objects
  validates :name, uniqueness: true
end
