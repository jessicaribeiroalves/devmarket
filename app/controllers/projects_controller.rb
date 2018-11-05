class ProjectsController < ApplicationController
  # Authenticate user before accessing website
  before_action :authenticate_user!, :except => [@projects, :index, :show, :set_project]
  before_action :set_project, only: [:show, :status_complete]

  def index
    @products = Product.all # for filtering options
    # ordered projects from oldest to newest, limit 20 results
    @projects = if params[:filter].present?
                  Project.where(:product_id => params[:filter]).order(updated_at: "asc").limit(20)
                else
                  Project.all.order(updated_at: "asc").limit(20)
                end
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
    # @rating = Rating.new # for creating a new rating - client
    @rated = @project.rating # for showing an existing rating

    @bid = Bid.new # for creating a new bid - devs
    @bids = @project.bids # bids for this project
    if @project.bids.find_by(:status => 2) != nil # check if there accepted bid
      @accepted_dev = @project.bids.find_by(:status => 2).user
    end
  end

  # Client's Dashboard
  def dashboard
    @open = Project.where(:status => 0)
    @ongoing = Project.where(:status => 1)
    @completed = Project.where(:status => 2)
  end

  # Developer's Dashboard
  def dashboard_developer
    @projects = Project.all
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
