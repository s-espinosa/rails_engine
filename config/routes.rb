Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/merchants/find', to: "merchants#find"
      get '/merchants/find_all', to: "merchants#find_all"
      get '/merchants/random', to: "merchants#random"
      namespace :merchants do
        get '/most_revenue', to: "most_revenue#index"
        get '/most_items', to: "most_items#index"
        get '/:id/items', to: "items#index"
        get '/:id/invoices', to: "invoices#index"
      end
      resources :merchants, only: [:index, :show]

      get '/customers/find', to: "customers#find"
      get '/customers/find_all', to: "customers#find_all"
      get '/customers/random', to: "customers#random"
      namespace :customers do
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoices', to: "invoices#index"
      end
      resources :customers, only: [:index, :show]

      get '/invoices/find', to: "invoices#find"
      get '/invoices/find_all', to: "invoices#find_all"
      get '/invoices/random', to: "invoices#random"
      namespace :invoices do
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/customer', to: "customers#show"
        get '/:id/merchant', to: "merchants#show"
        get '/:id/items', to: "items#index"
      end
      resources :invoices, only: [:index, :show]

      get '/items/find', to: "items#find"
      get '/items/find_all', to: "items#find_all"
      get '/items/random', to: "items#random"
      namespace :items do
        get '/most_items', to: "most_items#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/merchant', to: "merchants#show"
      end
      resources :items, only: [:index, :show]

      get '/transactions/find', to: "transactions#find"
      get '/transactions/find_all', to: "transactions#find_all"
      get '/transactions/random', to: "transactions#random"
      namespace :transactions do
        get '/:id/invoice', to: "invoices#show"
      end
      resources :transactions, only: [:index, :show]

      get '/invoice_items/find', to: "invoice_items#find"
      get '/invoice_items/find_all', to: "invoice_items#find_all"
      get '/invoice_items/random', to: "invoice_items#random"
      namespace :invoice_items do
        get '/:id/item', to: "items#show"
        get '/:id/invoice', to: "invoices#show"
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
end
