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
    new_points = game.hit_points_rival - ruby_object.number_attributes
    if game.turn == 1
      game.update(hit_points_rival: new_points, turn: 2)
    else
      game.update(hit_points: new_points, turn: 1)
    end
  end
end
