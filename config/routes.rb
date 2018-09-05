Rails.application.routes.draw do
  get 'user/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'playlists#index'

  resources :playlists

  resources :artists

  resources :songs

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'
end
