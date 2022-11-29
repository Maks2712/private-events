Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'events/index'
  resources :users, only: [:index, :show] do
    resources :events
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  # Defines the root path route ("/")
   root "events#index"
   
end
