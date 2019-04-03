class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path
    else
      render 'new'
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(article_params)
      redirect_to @article
    else
      render 'show'
    end
  end

  def destroy
    @players = Player.all
    @players.each { |player| player.destroy }

    redirect_to new_player_path
  end

  private

  def player_params
    params.require(:player).permit(:name, :rival)
  end
end
