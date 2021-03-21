# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists
  resources :tests_specifications, only: [:edit, :update]
  resources :submissions, only: [:index, :create, :show]
  resources :exercises
  resources :languages
  resources :categories

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "submissions/:id/:page", to: "submissions#show", as: "submission_ide"

  get "users/:id", to: "users#show", as: "user"
  get "users/me/lists", to: "users#lists", as: "user_lists"
  get "users/me/exercises", to: "users#exercises", as: "user_exercises"

  get "/input-generator", to: "input_generator#index"

  get "/home", to: "home#index"

  get "/notifications", to: "notifications#index", as: "notifications"

  root to: "home#index"
end
