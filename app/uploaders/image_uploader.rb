class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  include CarrierWave::MiniMagick
  storage :file
  process :resize_to_limit => [250, 250]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
