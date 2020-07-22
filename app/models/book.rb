class Book < ApplicationRecord
  acts_as_taggable_on :tags
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :author, :body
  belongs_to :topic

  def self.psychology
    tagged_with(%w[banging cool], any: true)
  end

  scope :marketing_items, -> { where(topic_id: 3) }
end
