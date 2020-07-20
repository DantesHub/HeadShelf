class Titan < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :name, :body, :main_image, :thumb_image
end
