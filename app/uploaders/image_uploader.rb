# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
   #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :s160x160 do
    process resize_to_fit: [160, 160]
  end
  version :s180x180 do
    process resize_to_fit: [180, 180]
  end
  version :s160x180 do
    process resize_to_fit: [160, 180]
  end
  version :s200x200 do
    process resize_to_fit: [200, 200]
  end
  version :s250x250 do
    process resize_to_fit: [250, 250]
  end
  version :s250x200 do
    process resize_to_fit: [250, 200]
  end
  version :s180x200 do
    process resize_to_fit: [180, 200]
  end
  version :s200x180 do
    process resize_to_fit: [200, 180]
  end
  version :s325x250 do
    process resize_to_fit: [325, 250]
  end


  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
