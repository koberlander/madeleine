Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show]
      # needs to follow conventions
      # get '/articles/', to: 'articles#index'
      # get '/articles/:id', to: 'articles#show'

      # get '/search', to: 'articles#search', as: 'search'
      post '/search', to: 'articles#search'
    end
  end
end
