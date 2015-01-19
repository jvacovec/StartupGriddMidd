Rails.application.routes.draw do
  get '/oauth2callback', to: 'application#oauth2callback'
  resources :tags, only: [:show, :index]
  resources :authors, only: [:show, :index]
  resources :posts, only: [:show, :index]
end
