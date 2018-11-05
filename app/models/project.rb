class Project < ApplicationRecord
  enum status: {cancelled: -1, open: 0, ongoing: 1, completed: 2}

  belongs_to :user
  belongs_to :product

  attribute :status, default: 0

  has_many :bids, dependent: :destroy
  has_one :rating, dependent: :destroy
end
