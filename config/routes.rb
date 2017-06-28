Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants/merchants" do
        get 'revenue',      to: 'merchants/revenue#index'
        get 'favorite_customer',                to: 'merchants/customer#show'
        get 'customers_with_pending_invoices', to: 'merchants/customer#index'
          collection do
            get 'find_all', to: 'merchants/find#index'
            get 'find',     to: 'merchants/find#show'
            get 'random',   to: 'merchants/random#show'
            get 'most_items', to: 'merchants/most_items#index'
            get 'revenue',      to: 'merchants/revenue#index'
            get 'most_revenue', to: 'merchants/most_revenue#index'
          end
      end

      resources :invoices, only: [:index, :show], :controller => "invoices/invoices" do
        collection do
          get 'find_all', to: 'invoices/find#index'
          get 'find',     to: 'invoices/find#show'
          get 'random',   to: 'invoices/random#show'
        end
      end

      resources :items, only: [:index, :show], :controller => "items/items" do
        collection do
          get 'find_all', to: 'items/find#index'
          get 'find',     to: 'items/find#show'
          get 'random',   to: 'items/random#show'
          get 'most_revenue', to: 'items/business#show'
          get 'most_items',   to: 'items/business#index'
          get 'best_day',     to: 'items/best#show'
        end
      end

      resources :invoice_items, only: [:index, :show], :controller => "invoice_items/invoice_items" do
        collection do
          get 'find_all', to: 'invoice_items/find#index'
          get 'find',     to: 'invoice_items/find#show'
          get 'random',   to: 'invoice_items/random#show'
        end
      end

      resources :customers, only: [:index, :show], :controller => "customers/customers" do
        get 'favorite_merchant', to: 'customers/favorite_merchant#show'
        collection do
          get 'find_all', to: 'customers/find#index'
          get 'find',     to: 'customers/find#show'
          get 'random',   to: 'customers/random#show'
        end
      end

      resources :transactions, only: [:index, :show], :controller => "transactions/transactions" do
        collection do
          get 'find_all', to: 'transactions/find#index'
          get 'find',     to: 'transactions/find#show'
          get 'random',   to: 'transactions/random#show'
        end
      end
    end
  end
end
