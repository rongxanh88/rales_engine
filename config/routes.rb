Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '', to: 'merchants#index'
        get ':id', to: 'merchants#show'
        get 'find_all?', to: 'find#index'
        get 'find?', to: 'find#show'
        get 'random', to: 'random#show'
      end

    end
  end
end
