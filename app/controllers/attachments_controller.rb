# app/controllers/attachments_controller.rb
class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_attachment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  def new
    @attachment = @project.attachments.build
  end

  def create
    @attachment = @project.attachments.build(attachment_params)
    @attachment.user = current_user

    if @attachment.save
      redirect_to @project, notice: "Attachment added."
    else
      render :new
    end
  end

  def destroy
    @attachment.destroy
    redirect_to @project, notice: "Attachment removed."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_attachment
    @attachment = @project.attachments.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:file)
  end

  def authorize_user!
    unless @attachment.user == current_user
      redirect_to @project, alert: "Access denied."
    end
  end
end
