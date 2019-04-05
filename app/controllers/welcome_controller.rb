# frozen_string_literal: true

# Welcome controller
class WelcomeController < ApplicationController
  def index
    @game = Game.new
  end
end
