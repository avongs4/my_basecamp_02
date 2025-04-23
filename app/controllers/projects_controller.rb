class ProjectsController < ApplicationController
  before_action :authenticate_user!

  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.users << current_user  # associate the project with the creator

    if @project.save
      redirect_to project_path(@project), notice: "Project created successfully."
    else
      flash.now[:alert] = "Failed to create project."
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated."
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path, notice: "Project deleted."
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
