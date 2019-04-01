class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @players = Player.all

    if @player.save
      if @players.count < 2
        render 'new'
      else 
        redirect_to games_path
      end
    else
      render 'new'
    end
  end

  def destroy
    @players = Player.all
    @players.each { |player| player.destroy }

    redirect_to new_player_path
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
