Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/merchants/find', to: "merchants#find"
      get '/merchants/find_all', to: "merchants#find_all"
      get '/merchants/random', to: "merchants#random"
      resources :merchants, only: [:index, :show]
    end
  end
end
