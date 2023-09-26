Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"

  resources :recipes do
    resources :compositions, only: %i[create]
  end
end
