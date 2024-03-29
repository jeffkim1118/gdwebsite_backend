Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :games
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # This is for login route. Using post request to create a session.
  post '/login', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

end
