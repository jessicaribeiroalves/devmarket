class ProjectsController < ApplicationController
  # Authenticate user before accessing website
  before_action :authenticate_user!, :except => [@projects, :index, :show, :set_project]
  before_action :set_project, only: [:show, :status_complete]

  def index
    @projects = Project.all
    @products = Product.all
    @product_1 = Product.find_by(option: "Basic Website")
    @product_2 = Product.find_by(option: "Ecommerce Website")
    @product_3 = Product.find_by(option: "Blog Site")
     
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

  def show
    @rating = Rating.new # for creating a new rating - client
    @rated = @project.rating # for showing an existing rating
    @bid = Bid.new # for creating a new bid - devs
  end

  # Client's Dashboard
  def dashboard
    @open = Project.where(:status => 0)
    @ongoing = Project.where(:status => 1)
    @completed = Project.where(:status => 2)
  end

   # Developer's Dashboard
  def dashboard_developer
    @pending_bids = Bid.all
    @open = Project.where(:status => 0)
    @ongoing = Project.where(:status => 1)
    @completed = Project.where(:status => 2)
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
    params.require(:project).permit(:product_id, :price, :title, :overview, :description, :deadline, :status)
  end
end
