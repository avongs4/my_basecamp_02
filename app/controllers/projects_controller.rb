class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authorize_project_member!, only: [:show]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.creator = current_user

    if @project.save
      @project.memberships.create(user: current_user)
      redirect_to @project, notice: "Project created!"
    else
      render :new
    end
  end

  def show
    @threads = @project.discussion_threads
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: "Project deleted."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def authorize_project_member!
    unless @project.users.include?(current_user)
      redirect_to projects_path, alert: "You are not a member of this project."
    end
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
