Rails.application.routes.draw do
  get 'welcome/index'

  resources :players
  resources :games
  resources :rankings

  root 'welcome#index'
end
