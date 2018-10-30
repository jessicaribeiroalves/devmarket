class Project < ApplicationRecord
  belongs_to :user
  has_many :bids
  has_one :rating
  has_one :product
end
