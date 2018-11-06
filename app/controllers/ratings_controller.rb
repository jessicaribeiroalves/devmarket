class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_user, only: [:create]

  def create
    @rating = Rating.new(params.require(:rating).permit(:rate, :testimony, :project_id))
    @rating.project_id = params[:project_id]
    
    accepted_dev = @rating.project.bids.find_by(status: 1).user_id
    dev = User.find(accepted_dev)

    respond_to do |format|
      if @rating.save
        # update_overall_rating
        dev.overall_rating = RatingService::calculate_overall_rating(@rating, dev)
        dev.save
        format.html { redirect_to project_path(params[:project_id]), notice: "Thank you for helping others!" }
      else
        format.html { redirect_to project_path(params[:project_id]), notice: "Please rate your developer." }
      end
    end
  end

  private

  # def update_overall_rating
  #   completed_projects = []
  #   ratings = []

  #   # Query for the Dev of this project
  #   accepted_dev = @rating.project.bids.find_by(status: 1).user_id
  #   dev = User.find(accepted_dev)
  #   # Query for the all projects the Dev was accepted
  #   dev_accepted_bids = dev.bids.where(status: 1)

  #   # Filter the query for the all projects completed by the Dev
  #   dev_accepted_bids.each do |bid|
  #     if bid.project.status == "completed"
  #       completed_projects.push(bid)
  #     end
  #   end

  #   # Filter the query for the all projects that rated the Dev
  #   completed_projects.each do |bid|
  #     if bid.project.rating != nil
  #       ratings.push(bid.project.rating.rate)
  #     end
  #   end
  #   # Calculate new overall average rating and save to User table
  #   updated_overall_rating = ratings.sum / ratings.size.to_f
  #   dev.overall_rating = updated_overall_rating
  #   dev.save
  # end

  def auth_user
    if AuthorizationService::complete_profile?(current_user)
    else
      if current_user.user_type == "client"
        redirect_to edit_user_registration_path, notice: "Please complete your profile before posting a rating"
      else
        redirect_to edit_user_registration_path, notice: "Please provide your name and phone number before continuing"
      end
    end
  end
end
