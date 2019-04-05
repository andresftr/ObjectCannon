Rails.application.routes.draw do
  get 'welcome/index'

  resources :games do
    resources :ruby_objects
  end

  root 'welcome#index'
end
