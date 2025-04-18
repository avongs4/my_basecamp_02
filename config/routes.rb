# config/routes.rb
Rails.application.routes.draw do
  root to: "home#index"

  # ✅ This must be outside of any class or scope
  devise_for :users

  get '/dashboard', to: 'dashboard#show', as: :dashboard


  namespace :admin do
    resources :users, only: [:index, :destroy] do
      member do
        patch :set_admin
        patch :remove_admin
      end
    end
  end

  resources :users, only: [:show]
  resources :projects
end
