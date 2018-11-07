class RatingsController < ApplicationController
  before_action :auth_user, only: [:create]

  def create
    @rating = Rating.new(params.require(:rating).permit(:rate, :testimony, :project_id))
    @rating.project_id = params[:project_id]

    accepted_dev = @rating.project.bids.find_by(status: 1).user_id
    dev = User.find(accepted_dev)

    respond_to do |format|
      if @rating.save
        dev.overall_rating = RatingService::calculate_overall_rating(@rating, dev)
        dev.save
        format.html { redirect_to project_path(params[:project_id]), notice: "Thank you for helping other businesses!" }
      else
        format.html { redirect_to project_path(params[:project_id]), notice: "Please rate your developer." }
      end
    end
  end

  private

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
