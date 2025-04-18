# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is authenticated

  def show
    # You can add logic to display the user-specific dashboard here
    @user = current_user
  end
end
