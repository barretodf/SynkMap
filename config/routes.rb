Rails.application.routes.draw do
  resources :profiles, only: [:show, :update]
end