class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :status_complete]

  def index
    @projects = Project.all
  end

  def show
    @rating = Rating.new # for creating a new rating
    @rated = @project.rating # for showing an existing rating
  end

  def new
    @project = Project.new
    @products = Product.all
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.save
  end

  def status_complete
    if @project.ongoing?
      @project.completed!
    end
    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:product_id, :price, :title, :overview, :description, :deadline)
  end
end
