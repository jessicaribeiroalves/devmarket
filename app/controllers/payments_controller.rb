class PaymentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = current_user
  end

  def process_payment
    # Amount in cents
    @amount = 1000

    # creates new customer, but our app creates one on User Registeration instead
    # customer = Stripe::Customer.create(
    #   :email => params[:stripeEmail],
    #   :source => params[:stripeToken],
    # )

    # sent customer_id to Stripe to get stripeToken
    customer = Stripe::Customer.retrieve(current_user.customer_id)
    customer.source = params[:stripeToken]
    customer.save

    # charges stripeToken
    charge = Stripe::Charge.create(
      :customer => current_user.customer_id,
      :amount => @amount,
      :description => "Rails Stripe customer",
      :currency => "aud",
    )

    redirect_to "/"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to '/'
  end
end

