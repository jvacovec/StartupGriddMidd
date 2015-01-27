Rails.application.routes.draw do
  devise_for :users
  root to: 'application#ping'
  get '/oauth2callback', to: 'application#oauth2callback'
  get '/search' => "search#search"
  get '/topics' => "tags#topics"
  get '/tags/:id/posts' => "tags#posts"
  get '/posts' => "posts#index"
  # resources :posts, only: [:index]
end
