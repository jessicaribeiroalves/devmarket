class Bid < ApplicationRecord
  belongs_to :project
  belongs_to :user

  attribute :status, default: 0
end
