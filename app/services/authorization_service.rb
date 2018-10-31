# FIXME - not tested
module AuthorizationService
  def complete_profile?(current_user)
    # FIXME - decide what attributes are mandatory. All or some?
    if current_user.name != :null && current_user.bio != :null
      true
    else
      if current_user.user_type == "dev"
        redirect_to edit_user_registration_path, notice: "Please complete your profile before placing an offer"
      else
        redirect_to edit_user_registration_path, notice: "Please complete your profile before posting a project"
      end
    end
  end
end
