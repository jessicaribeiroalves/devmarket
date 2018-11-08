class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_user, only: [:create, :accept_bid]

  def create
  # To place a bid - user must be a dev and not already have a bid
    if current_user.user_type == "dev" && current_user.bids.find_by(:project_id => params[:project_id]) == nil
      Bid.create(project_id: params[:project_id], user_id: current_user.id)

      flash[:notice] = "Bid was successfully created"
      redirect_to project_path(params[:project_id])
    else
      flash[:notice] = "You already made a bid on this project"
      redirect_to project_path(params[:project_id])
    end
  end

  # Accepting a bid from dev on client's dashboard
  def accept_bid
    @accepted_bid = Bid.find(params[:bid_id])
    @accepted_bid.status = 1
    @accepted_bid.save

  # Changing the project status to 'In Progress' and setting the project deadline
    @project = Project.find(params[:project_id])
    @project.status = 1
    @project.deadline = Date.today + Product.find(@project.product_id).duration
    @project.save

  # Rejecting all other project bids once 1 bid has been accepted
    @rejected_bids = Bid.where(:project_id => @project.id, :status => 0)
    @rejected_bids.each do |bid|
      bid.status = 2
      bid.save
    end

  # Flashnotice when client accepts a dev's bid

    flash[:notice] = "Bid accepted!"
    redirect_to projects_dashboard_path
  end

  private

  def auth_user
    if AuthorizationService::complete_profile?(current_user)
    else
      if current_user.user_type == "dev"
        redirect_to edit_user_registration_path, notice: "Please complete your profile before placing an offer"
      elsif current_user.user_type == "client"
        redirect_to edit_user_registration_path, notice: "Please complete your profile proceeding with this project"
      else
        redirect_to edit_user_registration_path, notice: "Please provide your name and phone number before continuing"
      end
    end
  end
end
