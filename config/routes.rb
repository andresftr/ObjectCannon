Rails.application.routes.draw do
  get 'games/new'
  post 'games/:id' => 'games#:id'

  resources :games do
    resources :ruby_objects
  end


  root 'games#new'
end
