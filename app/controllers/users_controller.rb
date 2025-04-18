class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :set_admin, :remove_admin, :destroy]

  def show
    @projects = @user.projects  # Assuming a User has_many Projects
  end

  def set_admin
    if current_user.admin?
      @user.make_admin!
      redirect_to user_path(@user), notice: "User promoted to admin"
    else
      redirect_to root_path, alert: "You are not authorized to do that"
    end
  end

  def remove_admin
    if current_user.admin?
      @user.remove_admin!
      redirect_to user_path(@user), notice: "Admin rights removed"
    else
      redirect_to root_path, alert: "You are not authorized to do that"
    end
  end

  def destroy
    if current_user == @user || current_user.admin?
      @user.destroy
      redirect_to root_path, notice: "Account deleted"
    else
      redirect_to root_path, alert: "You can't delete this user"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
