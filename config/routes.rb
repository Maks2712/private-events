Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users do
    resources :events
  end
  resources :events, only: %i[index]
  root "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
