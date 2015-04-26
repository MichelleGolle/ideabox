Rails.application.routes.draw do
  resources :users
  resources :ideas

  root 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
  end

  namespace :admin do
    resources :images
  end
end
