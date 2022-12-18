Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users do
    resources :events do
      member do
        post 'join_event'
        post 'leave_event'
      end
    end
  end
  resources :events, only: %i[index]
  #post 'events/join' => 'events#join_event'
  #post 'events/leave' => 'events#leave_event'
  root "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
