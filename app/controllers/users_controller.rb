class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: [:index, :set_admin, :remove_admin]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path, notice: "Account deleted successfully."
  end

  def set_admin
    user = User.find(params[:id])
    user.update(admin: true)
    redirect_to user_path(user), notice: "#{user.name} is now an admin."
  end

  def remove_admin
    user = User.find(params[:id])
    if user == current_user
      redirect_to user_path(user), alert: "You cannot demote yourself."
    else
      user.update(admin: false)
      redirect_to user_path(user), notice: "#{user.name} is no longer an admin."
    end
  end

  private

  def require_admin
    redirect_to root_path, alert: "You are not authorized." unless current_user.admin?
  end
end
