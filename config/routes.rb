# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists do
    resources :items do
      member do
        put '/check', action: :check
        put '/uncheck', action: :uncheck
      end
    end
  end
end
