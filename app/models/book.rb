class Book < ApplicationRecord
  acts_as_taggable_on :tags
  # accepts_nested_attributes_for :taggables,
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :author, :body

  mount_uploader :thumb_image, BookUploader

  def self.psychology
    Book.tagged_with(%w[psychology], any: true).order('created_at ASC')
  end

  def self.science
    Book.tagged_with(%w[science], any: true).order('created_at ASC')
    end

  def self.recent
    order('created_at DESC')
  end

  # scope :marketing_items, -> { where(topic_id: 3) }
end
