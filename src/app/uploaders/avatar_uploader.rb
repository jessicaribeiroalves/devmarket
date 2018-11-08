class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  ### Mini Magick ###
  process resize_to_fit: [200, 200]

  ### CarrierWave + AWS ###
  # Choose what kind of storage to use for this uploader:
  storage :aws

  # default avatar image from our AWE bucket
  def default_url
    "https://s3-ap-southeast-2.amazonaws.com/dev-market-auz/avatar_ninja.png"
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
