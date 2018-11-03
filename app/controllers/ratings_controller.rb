class RatingsController < ApplicationController
  def create
    # TODO Authorization

    @rating = Rating.new(params.require(:rating).permit(:rate, :testimony, :project_id))
    @rating.project_id = params[:project_id]

    respond_to do |format|
      if @rating.save
        format.html { redirect_to project_path(params[:project_id]), notice: "Thank you for helping others!" }
      else
        format.html { render :new }
      end
    end
  end

  private

  # def check_owner?
  #   if current_user.id == @project.user_id && :authenticate_user!
  #     true
  #   else
  #     redirect_to aroject_path(params[:project_id]), notice: "Sorry, you are not the owner of this project"
  #   end
  # end

end
