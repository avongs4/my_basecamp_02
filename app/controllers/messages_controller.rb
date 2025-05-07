class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_thread
  before_action :set_message, only: [:edit, :update, :destroy]
  before_action :authorize_project_member!
  before_action :authorize_message_owner!, only: [:edit, :update, :destroy]

  def create
    @message = @thread.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to project_discussion_thread_path(@project, @thread), notice: 'Message posted.'
    else
      redirect_to project_discussion_thread_path(@project, @thread), alert: 'Failed to post message.'
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to project_discussion_thread_path(@project, @thread), notice: 'Message updated.'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to project_discussion_thread_path(@project, @thread), notice: 'Message deleted.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_thread
    @thread = @project.discussion_threads.find(params[:discussion_thread_id])
  end

  def set_message
    @message = @thread.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def authorize_project_member!
    unless @project.users.include?(current_user) || @project.creator == current_user
      redirect_to projects_path, alert: "Access denied."
    end
  end
  

  def authorize_message_owner!
    unless @message.user == current_user
      redirect_to project_discussion_thread_path(@project, @thread), alert: "Access denied."
    end
  end
end
