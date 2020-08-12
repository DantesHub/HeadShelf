class Article < ApplicationRecord
  acts_as_taggable_on :tags
  enum status: { draft: 0, published: 1 }
  validates_presence_of :title, :body
  after_initialize :set_defaults
  # friendly_id :title, use: :slugged

  def set_defaults; end

  def self.recent
    order('created_at DESC')
  end
end
