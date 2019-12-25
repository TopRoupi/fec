Rails.application.routes.draw do
  resources :submissions_tests
  resources :submissions
  resources :tests
  resources :exercices
  resources :languages
  resources :categories
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'home/index'
  root to: 'home#index'
end
