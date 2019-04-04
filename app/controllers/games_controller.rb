class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      render 'show'
    end
  end

  def destroy
    @games = Game.find(params[:id])
    @games.destroy

    redirect_to game_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :rival)
  end

  def register_attack(attack)
    @game = Game.find(params[:id])

    if @game.turn == 1
      @game.hit_points_rival -= attack
      @game.turn = 2
    else
      @game.hit_points -= attack
      @game.turn = 1
    end
  end
end
