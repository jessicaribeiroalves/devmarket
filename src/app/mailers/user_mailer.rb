class UserMailer < ApplicationMailer
default from: 'devmarket.aus@gmail.comw'
 
  def project_start_dev_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def project_start_client_email
  end
end
