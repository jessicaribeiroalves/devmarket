class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader # carrierwave gem

  has_many :images, as: :imageable, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :bids, dependent: :destroy

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, uniqueness: true
  validates_length_of :password, in: 6..30, allow_blank: true
  validates :user_type, inclusion: {in: %w(client dev), message: "%{value} is required."}
  validates_length_of :name, in: 2..50, allow_blank: true
  validates_length_of :company_name, in: 2..50, allow_blank: true
  validates_length_of :bio, in: 10..500, allow_blank: true
  validates_length_of :city, in: 2..100, allow_blank: true
  validates_length_of :phone_number, in: 8..12, allow_blank: true
end
