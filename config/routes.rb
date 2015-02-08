Rails.application.routes.draw do
  get '/', to: 'application#ping'
  get '/oauth2callback', to: 'application#oauth2callback'
  get '/search' => "search#search"
  get '/topics' => "tags#topics"
  get '/tags/:id/posts' => "tags#posts"
  get '/posts' => "posts#index"
  get '/authors' => "authors#index"
  # resources :posts, only: [:index]
end
