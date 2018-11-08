class ProjectImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  ### Mini Magick ###
  process resize_to_fit: [800, 600]

  version :thumb do
    process resize_to_fill: [300,200]
  end

  ### CarrierWave + AWS ###
  # Choose what kind of storage to use for this uploader:
  storage :aws

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
