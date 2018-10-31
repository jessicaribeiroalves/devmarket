class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :bids

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_length_of :password, in: 6..30, allow_blank: true
  validates_presence_of :user_type
  validates_length_of :name, in: 2..32, allow_blank: true
  validates_length_of :name_company, in: 2..32, allow_blank: true
  validates_length_of :bio, in: 10..500, allow_blank: true
  validates_length_of :city, in: 2..100, allow_blank: true
  validates_length_of :phone_number, in: 8..12, allow_blank: true


  # ## Stripe
  # after_create_commit :add_customer_id #ActiveRecordCallback

  # # assigns Stripe customer_id upon User Registeration, for reuse
  # def add_customer_id
  #   if self.customer_id.nil? # if customer doesn't exist
  #     customer = Stripe::Customer.create(
  #       :email => self.email,
  #     )

  #     self.customer_id = customer.id
  #     self.save
  #   end
  # end
  # ## Stripe END
end
