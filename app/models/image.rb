class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  mount_uploader :name, ProjectImageUploader # carrierwave gem

  validates :name, presence: true
  validates :imageable_id, numericality: { only_integer: true }
  validates :imageable_type , presence: true
end
