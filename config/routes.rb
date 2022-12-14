Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :blessings, only: [:create, :index]
      get '/ping', to: 'trackings#ping_site'
      get '/clear_all_data0we24op', to: 'trackings#clear_data'
      get '/tracking_count', to: 'trackings#t_count'
      resources :trackings, only: [:create, :index]
    end
  end
end
