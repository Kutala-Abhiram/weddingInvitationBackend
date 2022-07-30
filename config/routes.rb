Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :blessings, only: [:create]
      get '/ping', to: 'trackings#ping_site'
      get '/clear_all_data0we24op', to: 'trackings#clear_data'
      resources :trackings, only: [:create]
    end
  end
end
