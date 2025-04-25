Rails.application.routes.draw do
  # Devise routes with custom RegistrationsController
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # User admin controls
  resources :users, only: [:index, :show, :destroy] do
    member do
      patch :set_admin
      patch :remove_admin
    end
  end

  # Project and nested resources
  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :attachments, only: [:create, :destroy]
    resources :discussion_threads, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :messages, only: [:create, :edit, :update, :destroy]
    end

    member do
      post :add_user
    end
  end

  # Root path
  root to: "home#index", as: :home
end
