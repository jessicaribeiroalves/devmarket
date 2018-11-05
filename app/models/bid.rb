class Bid < ApplicationRecord
  enum status: {pending: 0, accepted: 1, rejected: 2}
  attribute :status, default: 0
  
  belongs_to :project
  belongs_to :user
end
