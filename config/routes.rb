Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/merchants/find', to: "merchants#find"
      get '/merchants/find_all', to: "merchants#find_all"
      get '/merchants/random', to: "merchants#random"
      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get '/:id/items', to: "items#index"
        get '/:id/invoices', to: "invoices#index"
      end

      get '/customers/find', to: "customers#find"
      get '/customers/find_all', to: "customers#find_all"
      get '/customers/random', to: "customers#random"
      resources :customers, only: [:index, :show]
      namespace :customers do
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoices', to: "invoices#index"
      end

      get '/invoices/find', to: "invoices#find"
      get '/invoices/find_all', to: "invoices#find_all"
      get '/invoices/random', to: "invoices#random"
      resources :invoices, only: [:index, :show]
      namespace :invoices do
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/customer', to: "customers#show"
        get '/:id/merchant', to: "merchants#show"
      end

      get '/items/find', to: "items#find"
      get '/items/find_all', to: "items#find_all"
      get '/items/random', to: "items#random"
      resources :items, only: [:index, :show]
      namespace :items do
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/merchant', to: "merchants#show"
      end

      get '/transactions/find', to: "transactions#find"
      get '/transactions/find_all', to: "transactions#find_all"
      get '/transactions/random', to: "transactions#random"
      resources :transactions, only: [:index, :show]
      namespace :transactions do
        get '/:id/invoice', to: "invoices#show"
      end

      get '/invoice_items/find', to: "invoice_items#find"
      get '/invoice_items/find_all', to: "invoice_items#find_all"
      get '/invoice_items/random', to: "invoice_items#random"
      resources :invoice_items, only: [:index, :show]
      namespace :invoice_items do
        get '/:id/item', to: "items#show"
        get '/:id/invoice', to: "invoices#show"
      end
    end
  end
end
