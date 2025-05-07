class DiscussionThreadsController < ApplicationController
  before_action :set_project
  before_action :set_thread, only: [:edit, :update, :destroy]
  before_action :require_admin!

  def new
    @discussion_thread = @project.discussion_threads.new
  end

  def create
    @discussion_thread = @project.discussion_threads.new(thread_params)
    @discussion_thread.user = current_user
    if @discussion_thread.save
      redirect_to project_path(@project), notice: "Thread created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @thread = @project.discussion_threads.find(params[:id])
    @messages = @thread.messages.includes(:user)
    @message = Message.new
  end
  
  


  def edit; end

  def update
    if @discussion_thread.update(thread_params)
      redirect_to project_path(@project), notice: "Thread updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @discussion_thread.destroy
    redirect_to project_path(@project), notice: "Thread deleted!"
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_thread
    @discussion_thread = @project.discussion_threads.find(params[:id])
  end

  def thread_params
    params.require(:discussion_thread).permit(:title)
  end

  def require_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "Access denied."
    end
  end
end
