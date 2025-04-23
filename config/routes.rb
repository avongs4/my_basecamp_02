Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :destroy] do
    member do
      patch :set_admin
      patch :remove_admin
    end
  end

  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :attachments, only: [:create, :destroy]
    resources :discussion_threads, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :messages, only: [:create, :edit, :update, :destroy]
    end
  end
  
  

  root to: "home#index", as: :home

end
