Rails.application.routes.draw do
  root to: 'dashboard#index'

  get '/login', to: 'sessions#new'
  delete '/session', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create', as: 'auth_callback'
end
