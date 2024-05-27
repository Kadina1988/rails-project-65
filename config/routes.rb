Rails.application.routes.draw do
  root 'web/bulletins#index'

  scope module: 'web' do
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
    resources :bulletins, only: %i[index new create]
  end
end
