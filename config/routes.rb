# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists do
    resources :items do
      member do
        put '/check', action: :check
        put '/uncheck', action: :uncheck
      end
    end
  end

  post '/users', to: 'users#create'
  post '/users/login', to: 'users#login'
  get '/users/logged', to: 'users#show'
  put '/users/logged', to: 'users#update'
  delete '/users/logged', to: 'users#destroy'

  match '*path', to: 'application#not_found', via: :all
end
