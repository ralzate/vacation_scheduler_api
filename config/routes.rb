Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:create]
  resources :sessions, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :vacations
    end
  end
  
end
