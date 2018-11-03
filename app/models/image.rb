class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  mount_uploader :name, ProjectImageUploader # carrierwave gem
end
