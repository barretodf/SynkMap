patch 'users/:id/bio', to: 'users#update_bio', as: 'update_user_bio'
patch 'users/:id/genres', to: 'users#update_genres', as: 'update_user_genres'
patch 'users/:id/services', to: 'users#update_services', as: 'update_user_services'
patch 'users/:id/availability', to: 'users#update_availability', as: 'update_user_availability'
get 'profiles/:id', to: 'profiles#show', as: 'profile'

resources :music_genres, only: [:index]

resources :music_genres, only: [:index] do
    member do
      post 'add_to_user'
      delete 'remove_from_user'
    end
  end
  
  resources :availabilities, only: [:index, :update]

