# frozen_string_literal: true

Rails.application.routes.draw do
  get "home/index"
  namespace :backoffice do
    resources :colors
    resources :fonts
    resources :qualities
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
