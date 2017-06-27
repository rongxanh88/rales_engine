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
    end
  end
end
