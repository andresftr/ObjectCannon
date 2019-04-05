# frozen_string_literal: true

# Here are the CRUD methods to the Games
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
end
