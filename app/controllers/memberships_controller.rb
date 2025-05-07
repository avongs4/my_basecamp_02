class MembershipsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project
    before_action :authorize_admin!
  
    def create
      user = User.find_by(email: params[:email])
      if user
        unless @project.users.include?(user)
          @project.memberships.create(user: user)
          redirect_to @project, notice: "#{user.name} has been added to the project."
        else
          redirect_to @project, alert: "User is already a member."
        end
      else
        redirect_to @project, alert: "User not found."
      end
    end
  
    def destroy
      membership = @project.memberships.find_by(user_id: params[:id])
      if membership
        membership.destroy
        redirect_to @project, notice: "User removed from project."
      else
        redirect_to @project, alert: "Membership not found."
      end
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
  
    def authorize_admin!
      unless current_user.admin? || @project.creator == current_user
        redirect_to @project, alert: "Only project admins can manage members."
      end
    end
  end
  