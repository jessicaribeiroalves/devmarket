class Project < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :bids, dependent: :destroy
  has_one :rating, dependent: :destroy
  mount_uploader :project_image, ProjectImageUploader
  has_many :images, as: :imageable
end
