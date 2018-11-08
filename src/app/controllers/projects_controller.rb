class ProjectsController < ApplicationController
# Authenticate user before accessing website
  before_action :authenticate_user!, :except => [:index]
  before_action :set_project, only: [:show, :cancel_project, :status_complete]
  before_action :auth_user, only: [:create, :cancel_bid, :cancel_project, :status_complete]

  def index
    @products = Product.all # for filtering options

    # ordered projects from oldest to newest, limit 20 results
    @projects = if params[:filter].present?
                  Project.where(:product_id => params[:filter]).order(updated_at: "asc").limit(24)
                else
                  Project.all.order(updated_at: "asc").limit(24)
                end
  end

  def new
    if current_user.user_type == "client"
      @project = Project.new
      @products = Product.all
    else
      redirect_to root_path, notice: "You are not allowed to create a project."
    end
  end

  def create
    if current_user.user_type == "client"
    # begin
      @project = Project.new(project_params)
      product_id = params[:project][:product_id]
      # raise "Please complete project form" unless product_id.empty?

      amount = Product.find(product_id).price
      # raise "Please complete project form" unless amount.nil?

      @project.user_id = current_user.id
      @project.price = amount

      if @project.save
        charge = stripe_payment(amount)
        @project.charge_id = charge.id
        @project.save
      end
    # rescue => e
    #   flash[:error] = e.message
    #   render :new
    # end
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
    if Bid.find(params[:id]).destroy
      redirect_to projects_dashboard_developer_path, notice: "Bid cancelled."
    else
      redirect_to projects_dashboard_developer_path, notice: "Unable to cancel this project. Please contact the DevMarket team."
    end
  end

  def cancel_project # For Clients
    if @project.open?
      @project.cancelled!
      redirect_to projects_dashboard_path, notice: "Project cancelled. Please contact the DevMarket team regarding your refund."
    else
      redirect_to projects_dashboard_path, notice: "Unable to cancel this project. Please contact the DevMarket team."
    end
  end

  # Changing the project status to 'Completed' when client clicks on completed button
  def status_complete
    if @project.ongoing?
      @project.completed!
      redirect_to projects_dashboard_path, notice: "Project completed!"
    else
      redirect_to projects_dashboard_path, notice: "Unable to completed this project. Please contact the DevMarket."
    end
  end

  private

  # Level 2 Authorization for Dev-Bids and Client-Projects, require name and phone to be filled
  def auth_user
    if AuthorizationService::complete_profile?(current_user)
    else
      if current_user.user_type == "dev"
        redirect_to edit_user_registration_path, notice: "Please complete your profile before placing an offer"
      elsif current_user.user_type == "client"
        redirect_to edit_user_registration_path, notice: "Please complete your profile before posting a project"
      else
        redirect_to edit_user_registration_path, notice: "Please provide your name and phone number before continuing"
      end
    end
  end

  def stripe_payment(amount)
    # Stripe customer id create or retrieve from database
    if current_user.stripe_id.nil?
      customer = Stripe::Customer.create(
        :email => current_user.email,
      )
      current_user.stripe_id = customer.id
      current_user.save
    end

    # Retrieve customer id and retrieve stripe token
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.source = params[:stripeToken]
    customer.save

    # Process payment with Stripe
    charge = Stripe::Charge.create(
      :amount => amount,
      :currency => "aud",
      :customer => current_user.stripe_id,
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:product_id, :title, :overview, :description)
  end
end
