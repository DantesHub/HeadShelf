class Book < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :author, :body
  belongs_to :topic

  def self.psychology
    where(title: 'book')
  end

  scope :marketing_items, -> { where(topic_id: 3) }
end
