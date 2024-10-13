Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :user, only: [ :show ] 
      resources :feeds, only: [ :show ]
      resources :posts, only: [ :index, :show, :create, :update, :destroy ] do
        resources :comments, only: [ :create, :destroy ]
        resources :likes, only: [ :create ]
      end
      resources :comments, only: [ :show, :destroy ]
      resources :likes, only: [ :show, :destroy, :index ]
    end
  end
end
