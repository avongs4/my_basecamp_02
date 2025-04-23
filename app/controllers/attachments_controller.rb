class AttachmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project
  
    def create
      @attachment = @project.attachments.new(user: current_user)
      @attachment.file.attach(params[:attachment][:file])
  
      if @attachment.save
        redirect_to @project, notice: "File uploaded successfully."
      else
        redirect_to @project, alert: "Failed to upload file."
      end
    end
  
    def destroy
      @attachment = @project.attachments.find(params[:id])
      if @attachment.user == current_user
        @attachment.destroy
        redirect_to @project, notice: "File deleted."
      else
        redirect_to @project, alert: "Not authorized."
      end
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    end
  end
  