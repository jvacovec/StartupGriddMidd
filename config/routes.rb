Rails.application.routes.draw do
  get '/oauth2callback', to: 'application#oauth2callback'
  resources :tags, only: [:show, :index]
  resources :authors, only: [:show, :index] do
  	resources :posts, only: [:index]
  end
  resources :posts, only: [:show, :index]
end
