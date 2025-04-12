Rails.application.routes.draw do
    root "home#index"
  
    devise_for :users
  
    get 'profiles/:id', to: 'profiles#show', as: 'profile'
  
    resources :users, only: [] do
      patch 'bio', to: 'users#update_bio', on: :member
      patch 'genres', to: 'users#update_genres', on: :member
      patch 'services', to: 'users#update_services', on: :member
      patch 'availability', to: 'users#update_availability', on: :member
    end
  
    resources :music_genres, only: [:index] do
      post 'add_to_user', on: :member
      delete 'remove_from_user', on: :member
    end
  
    resources :availabilities, only: [:index, :update]
  
    resource :contact, only: [:new, :create]
  end
  