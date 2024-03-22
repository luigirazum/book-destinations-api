# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  post 'social_auth/callback', to: 'social_auth#authenticate_social_auth_user'

  namespace :api do
    namespace :v1 do
      resources :destinations, only: %i[index show create update destroy]
      resources :reservations, only: %i[index create]
    end
  end

  root 'users#index'
end
