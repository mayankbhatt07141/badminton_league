Rails.application.routes.draw do
  root "leaderboard#index"

  resources :players, only: %i[index show new create destroy]
  resources :matches, only: %i[index new create]

  get "up" => "rails/health#show", as: :rails_health_check
end
