Rails.application.routes.draw do
  # Root (homepage)
  root "trees#index"

  # Resourceful routes (THIS is the important part)
  resources :trees, only: [:index, :show]
  resources :sites, only: [:index, :show]
  resources :neighbourhoods, only: [:index, :show]

  # About page
  get "about", to: "pages#about"

  # Keep this (Rails health check)
  get "up" => "rails/health#show", as: :rails_health_check
end