class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @user = User.find(params[:id])
    end
  
    def destroy
      @user = User.find(params[:id])
      if current_user == @user || current_user.admin?
        @user.destroy
        redirect_to root_path, notice: "Account deleted"
      else
        redirect_to root_path, alert: "You can't delete this user"
      end
    end
  end
  