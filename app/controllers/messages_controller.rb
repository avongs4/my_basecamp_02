class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion_thread
  before_action :set_project
  before_action :set_message, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def create
    @message = @discussion_thread.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to project_discussion_thread_path(@project, @discussion_thread), notice: 'Message posted.'
    else
      redirect_to project_discussion_thread_path(@project, @discussion_thread), alert: 'Failed to post message.'
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to project_discussion_thread_path(@project, @discussion_thread), notice: 'Message updated.'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to project_discussion_thread_path(@project, @discussion_thread), notice: 'Message deleted.'
  end

  private

  def set_discussion_thread
    @discussion_thread = DiscussionThread.find(params[:discussion_thread_id])
  end

  def set_project
    @project = @discussion_thread.project
  end

  def set_message
    @message = @discussion_thread.messages.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Not authorized" unless @message.user == current_user
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
