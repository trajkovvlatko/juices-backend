class Image < ApplicationRecord
  mount_uploader :path, ImageLocalUploader
end
