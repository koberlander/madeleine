Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show]

      get '/search', to: 'articles#search', as: 'search'
    end
  end
end
