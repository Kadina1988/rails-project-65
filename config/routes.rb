# frozen_string_literal: true

Rails.application.routes.draw do
  root 'web/bulletins#index'

  scope module: 'web' do
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
    get 'auth/sing_out', to: 'auth#sign_out', as: :sign_out
    get 'profile', to: 'user#profile'
    patch 'bulletins/:id/to_moderate', to: 'bulletins#to_moderate', as: :to_moderate
    patch 'bulletins/:id/archive', to: 'bulletins#archive', as: :to_archive

    resources :bulletins, except: [:destroy]

    namespace :admin do
      root 'bulletins#on_moderation'
      resources :categories, only: %i[index new create edit update destroy]
      resources :bulletins, only: %i[index]
      patch 'bulletins/:id/archive', to: 'bulletins#archive', as: :archive
      patch 'bulletins/:id/publish', to: 'bulletins#publish', as: :publish
      patch 'bulletins/:id/reject', to: 'bulletins#reject', as: :reject
    end

  end
end
