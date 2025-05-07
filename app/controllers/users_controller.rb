class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :set_admin, :remove_admin]
  before_action :authorize_admin!, only: [:set_admin, :remove_admin]

  def show
    Rails.logger.debug "DEBUG: #{@user.name} admin? #{@user.admin?}"
  end

  def index
    @users = User.all
  end

  def set_admin
    if @user.update(admin: true)
      redirect_to @user, notice: "#{@user.name} has been promoted to admin."
    else
      redirect_to @user, alert: "Failed to promote user."
    end
  end

  def remove_admin
    if @user.update(admin: false)
      redirect_to @user, notice: "#{@user.name} has been demoted from admin."
    else
      redirect_to @user, alert: "Failed to demote user."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
