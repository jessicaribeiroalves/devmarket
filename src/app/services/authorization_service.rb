module AuthorizationService
  def self.complete_profile?(current_user)
    if current_user.name != nil && current_user.name != "" && current_user.phone_number != nil && current_user.phone_number != ""
      true
    end
  end
end
