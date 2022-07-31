# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:create]
    resources :businesses, only: %i[show create update]
    resources :competitors, only: %i[show create update]
    resources :qualities, only: [:index]
    resources :dimensions, only: [:create]
  end
  namespace :backoffice do
    resources :dimensions
    resources :colors
    resources :fonts
    resources :qualities
  end
  root "home#index"
end
