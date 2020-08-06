class Titan < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_presence_of :name, :body, :main_image, :thumb_image

  def self.by_position
    order('position ASC')
  end
end
