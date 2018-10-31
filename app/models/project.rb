class Project < ApplicationRecord
  belongs_to :user
  has_one :product
  has_many :bids
  has_one :rating
end
