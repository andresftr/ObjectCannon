Rails.application.routes.draw do
  get 'games/new'

  resources :games

  root 'games#new'
end
