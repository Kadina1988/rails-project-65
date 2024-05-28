# frozen_string_literal: true

Rails.application.routes.draw do
  root 'web/bulletins#index'

  scope module: 'web' do
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
    resources :bulletins, only: %i[index new create]

    namespace :admin do
      resources :categories, only: %i[index new create edit update destroy]
      resources :bulletins, only: %i[index]
    end

    get 'profile', to: 'user#profile'
  end
end
