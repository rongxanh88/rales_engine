Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants/merchants" do
        collection do
          get 'find_all', to: 'merchants/find#index'
          get 'find', to: 'merchants/find#show'
          get 'random', to: 'merchants/random#show'
        end
      end

      namespace :invoices do
        get '',           to: 'invoices#index'
        get ':id',        to: 'invoices#show'
        get 'find_all',  to: 'find#index'
        get 'find',      to: 'find#show'
      end

      namespace :items do
        get '',                       to: 'items#index'
        get ':id',                    to: 'items#show'
        get 'find_all?',              to: 'find#index'
        get 'find?',                  to: 'find#show'
        get 'most_revenue?quantity=', to: 'business#show'
      end

      Mason
      GET /api/v1/merchants/:id/customers_with_pending_invoices
      GET /api/v1/merchants/:id/favorite_customer
      GET /api/v1/items/most_revenue?quantity=x
      GET /api/v1/merchants/revenue?date=x
      GET /api/v1/merchants/most_revenue?quantity=x

      Bao
      GET /api/v1/merchants/:id/revenue
      GET /api/v1/merchants/:id/revenue?date=x
      GET /api/v1/merchants/most_items?quantity=x
      GET /api/v1/customers/:id/favorite_merchant
      GET /api/v1/items/:id/best_day
      GET /api/v1/items/most_items?quantity=x

      resources :merchants, only: [:index, :show]
    end
  end
end
