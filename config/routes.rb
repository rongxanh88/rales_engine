Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :invoices do
        get '',           to: 'invoices#index'
        get ':id',        to: 'invoices#show'
        get 'find_all?',  to: 'find#index'
        get 'find?',      to: 'find#show'
      end

      resources :merchants, only: [:index, :show]
    end
  end
end
