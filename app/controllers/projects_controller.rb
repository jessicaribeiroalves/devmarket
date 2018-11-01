class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])

    @rating = Rating.new # required for creating a rating
    # @rated = Project.find(params[:id]).rating   FIXME returning nil
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.save
  end

  def new
    @project = Project.new
    @products = Product.all
  end

  private

  def project_params
    params.require(:project).permit(:product_id, :price, :title, :overview, :description, :deadline)
  end
end
