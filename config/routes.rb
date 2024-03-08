Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard/rentee', to: "dashboards#rentee"
  get 'dashboard/renter', to: 'dashboards#renter'
  resources :clothings do
    resources :rentals
  end

  post "accept/:id", to: 'rentals#accept', as: 'rental_approval'
  post "reject/:id", to: 'rentals#reject', as: 'rental_rejection'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
