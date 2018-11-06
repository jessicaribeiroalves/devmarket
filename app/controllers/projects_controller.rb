class ProjectsController < ApplicationController
  # Authenticate user before accessing website
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :status_complete]

  def index    
    @products = Product.all # for filtering options
    # # ordered projects from oldest to newest, limit 20 results
    @projects = if params[:filter].present?
                  Project.where(:product_id => params[:filter]).order(updated_at: "asc").limit(20)
                else
                  Project.all.order(updated_at: "asc").limit(20)
                end
  end

  def new
    if current_user.user_type == "client"
      @project = Project.new
      @products = Product.all
    else
      redirect_to root_path
    end
  end

  def create
    if current_user.user_type == "client"
      @project = Project.new(project_params)
      @project.user_id = current_user.id
      @project.save
    else
      redirect_to root_path
    end
  end

  def show
    @rating = Rating.new # for creating a new rating - client
    @rated = @project.rating # for showing an existing rating

    @bid = Bid.new # for creating a new bid - devs
    @bids = @project.bids # bids for this project

    if @project.bids.find_by(:status => 1) != nil # check if there accepted bid
      @accepted_dev = @project.bids.find_by(:status => 1).user
    end
  end

  # Client's Dashboard
  def dashboard
    if current_user.user_type == "client"
      @open = Project.where("user_id = #{current_user.id} AND status = 0")
      @ongoing = Project.where("user_id = #{current_user.id} AND status = 1")
      @completed = Project.where("user_id = #{current_user.id} AND status = 2")
    else
      redirect_to root_path
    end
  end

  # Developer's Dashboard
  def dashboard_developer
    if current_user.user_type == "dev"
      @pending_bids = Bid.where("user_id = #{current_user.id} AND status = 0")
      @accepted_bids = Bid.where("user_id = #{current_user.id} AND status = 1")
    else
      redirect_to root_path
    end
  end

  def cancel_bid # For Developers
    Bid.find(params[:id]).destroy
    redirect_to projects_dashboard_developer_path, notice: "Bid cancelled."
  end

  def cancel_project # For Clients
    project = Project.find(params[:id])
    if project.open?
      project.cancelled!
      redirect_to projects_dashboard_path, notice: "Project cancelled. Please contact the DevMarket team regarding your refund."
    end
  end

  # Changing the project status to 'Completed' when client clicks on completed button
  def status_complete
    if @project.ongoing?
      @project.completed!
    end
    redirect_to projects_dashboard_path, notice: "Project completed!"
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:product_id, :price, :title, :overview, :description, :deadline, :status)
  end
end
