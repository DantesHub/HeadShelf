class Titan < ApplicationRecord
  has_many :titan_books
  accepts_nested_attributes_for :titan_books, reject_if: ->(attrs) { attrs['name'].blank? }
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :thumb_image, TitanUploader
  mount_uploader :main_image, TitanUploader
  validates_presence_of :name, :body

  def self.by_position
    order('position ASC')
  end
end
