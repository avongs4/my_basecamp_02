class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.users << current_user  # associate the project with the creator

    if @project.save
      redirect_to @project, notice: "Project created successfully."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: "Project deleted successfully."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
