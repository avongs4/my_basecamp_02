Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    resources :memberships, only: [:create, :destroy]

    resources :attachments, only: [:new, :create, :destroy]

    resources :discussion_threads, only: [:show, :new, :create, :edit, :update, :destroy] do


      
      resources :messages, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :users, only: [:index, :show, :destroy] do
    member do
      patch :set_admin
      patch :remove_admin
    end
  end

  root "home#index"
end
