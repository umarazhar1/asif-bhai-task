class ProjectsController < ApplicationController

  # load_and_authorize_resource  # Added this line due to cancancan
  before_action :authorize_manager, only: [:new, :create]

  def show
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # @project.user = User.first    #added temporarily
    @project.user = current_user
    if @project.save
      flash[:notice] = "Project is created successfully!"
      redirect_to project_path(@project)
    else
      flash[:notice] = "Failed to create the project!"
      #render 'new'
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

  def authorize_manager
    redirect_to root_path, alert: 'Only managers can create projects.' unless current_user.manager?
  end

end
