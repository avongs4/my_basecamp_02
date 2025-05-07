# ThreadsController
before_action :authorize_project_member!

def index
  @project = Project.find(params[:project_id])
  @threads = @project.threads
end

private

def authorize_project_member!
  @project = Project.find(params[:project_id])
  unless @project.users.include?(current_user)
    redirect_to root_path, alert: "You are not authorized to view this project."
  end
end
