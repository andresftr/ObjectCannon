# frozen_string_literal: true

# Here are the CRUD's methods to the RubyObject
class RubyObjectsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @ruby_object = @game.ruby_objects.create(ruby_object_params)
    update_data(@game, @ruby_object)
    redirect_to game_path(@game)
  end

  private

  def ruby_object_params
    params.require(:ruby_object).permit(:attacker, :number_attributes)
  end

  def update_data(game, ruby_object)
    if game.turn == 1
      new_points = game.hit_points_rival - ruby_object.number_attributes
      game.update(hit_points_rival: new_points, turn: 2)
    else
      new_points = game.hit_points - ruby_object.number_attributes
      game.update(hit_points: new_points, turn: 1)
    end
  end
end
