Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  get 'profiles/:id', to: 'profiles#show', as: 'profile'

  resources :users, only: [] do
    member do
      patch :update_bio
      patch :update_genres
      patch :update_services
      patch :update_availability
    end
  end

  resources :music_genres, only: [:index] do
    member do
      post :add_to_user
      delete :remove_from_user
    end
  end

  resources :availabilities, only: [:index, :update]

  resource :contact, only: [:new, :create]

  resources :service_types, only: [:create, :update, :destroy]

end