class ImageLocalUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "images/#{model.recipe_id}/#{model.id}"
  end

  process :auto_orient

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [256, 256]
  end

  version :medium do
    process :resize_to_fill => [1280, 1280]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
    end
  end
end
