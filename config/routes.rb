Rails.application.routes.draw do
  get 'rooms/index'
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  root "pages#home"

  resources :rooms do
    resources :messages
  end
  
  devise_scope :user do 
    get 'users', to: 'devise/session#new'
  end


  get 'user/:id', to: 'users#show', as: 'user'
  
end
