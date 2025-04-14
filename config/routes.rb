root to: "home#index"

# Devise user routes already added:
# devise_for :users

# Optional: user profile routes
resources :users, only: [:show, :destroy]
