# frozen_string_literal: true

# Here are the validations and other things related with the RubyObject model
class RubyObject < ApplicationRecord
  belongs_to :game

  validates :number_attributes, numericality: { only_integer: true,
                                                greater_than_or_equal_to: 1,
                                                less_than_or_equal_to: 25 }
end
