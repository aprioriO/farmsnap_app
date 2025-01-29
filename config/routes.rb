Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'events/index'
  get 'events/show'
  get 'events/edit'
  get 'events/update'
  get 'events/new'
  get 'events/create'
  get 'events/destroy'


  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :farmers, exlude: [:destroy]


  resources :events do
    resources :event_attendances, only: [:create, :destroy]
    collection do
      get "seafood", to: "events#seafood", as: "seafood"
      get "dairy", to: "events#dairy", as: "dairy"
      get "meat", to: "events#meat", as: "meat"
      get "organic", to: "events#organic", as: "organic"
      get "halal", to: "events#halal", as: "halal"
      get "fruit-and-veg", to: "events#fruitandveg", as: "fruit_and_veg"
      get "baked-goods", to: "events#baked_goods", as: "baked_goods"
      get "alcohol", to: "events#alcohol", as: "alcohol"
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end

# URLS
# Events/
