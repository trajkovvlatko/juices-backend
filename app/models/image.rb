class Image < ApplicationRecord
  mount_uploader :path, ImageUploader
end
