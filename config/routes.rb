# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :competitors
    resources :businesses
  end
  namespace :backoffice do
    resources :dimensions
    resources :colors
    resources :fonts
    resources :qualities
  end
  root "home#index"
end
