class Project < ApplicationRecord
  belongs_to :user
  has_many :bids
  has_one :rating
  belongs_to :product
  attribute :status, default: 0
end
