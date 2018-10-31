class Project < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :bids
  has_one :rating
  mount_uploader :project_image, ProjectImageUploader
  has_many :images, as: :imageable
end
