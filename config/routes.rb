# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :backoffice do
    resources :dimensions
    resources :colors
    resources :fonts
    resources :qualities
  end
  root "home#index"
end
