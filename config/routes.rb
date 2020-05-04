Rails.application.routes.draw do
  resources :submissions, only: [:index, :create, :show]
  resources :exercices
  resources :languages
  resources :categories

  devise_for :users, controllers: { registrations: 'registrations' }

  get 'users/:id', to: "users#show", as: 'user'
  get '/input-generator', to: 'input_generator#index'
  get '/home', to: 'home#index'
  
  root to: 'home#index'
end
