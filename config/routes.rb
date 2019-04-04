Rails.application.routes.draw do
  get 'games/new'

  resources :games do
    resources :ruby_objects
  end


  root 'games#new'
end
