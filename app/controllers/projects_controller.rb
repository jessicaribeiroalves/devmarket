class ProjectsController < ApplicationController
  # Authenticate user before accessing website
  before_action :authenticate_user!, :except => [@projects, :index, :show, :set_project]
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
    @open = Project.where("user_id = #{current_user.id} AND status = 0")
    @ongoing = Project.where("user_id = #{current_user.id} AND status = 1")
    @completed = Project.where("user_id = #{current_user.id} AND status = 2")
  end

  # Developer's Dashboard
  def dashboard_developer
    @pending_bids = Bid.where("user_id = #{current_user.id} AND status = 0")
    @accepted_bids = Bid.where("user_id = #{current_user.id} AND status = 1")
    # @ongoing = Project.where("user_id = #{current_user.id} AND status = 1")
    @completed = Project.where("user_id = #{current_user.id} AND status = 2")
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
