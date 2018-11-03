class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params["image"].present?
      if current_user.images.count < 6
        @image = current_user.images.create(params.require(:image).permit(:name))
        @image.save
        redirect_to edit_user_registration_path, notice: "Image uploaded. High-five!"
      else
        redirect_to edit_user_registration_path, notice: "Maximum of 6 images, please remove one first"
      end
    else
      redirect_to edit_user_registration_path, notice: "No image selected."
    end
  end

  def destroy
    User.find(current_user.id).images.find(params[:id]).destroy

    redirect_to edit_user_registration_path, notice: "Image removed."
  end
end
