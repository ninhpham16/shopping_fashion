# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  belongs_to :blogs
  mount_uploader :file, ImageLinkUploader
end
