class Book < ApplicationRecord
  acts_as_taggable_on :tags
  # accepts_nested_attributes_for :taggables,
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :author, :body, :buy_link, :tag_list, :preview

  mount_uploader :thumb_image, BookUploader

def self.recent
  Book.order('created_at DESC')
end

  def self.favorite
    Book.tagged_with(%w[favorites], any: true).order('created_at DESC')
  end

  def self.category(cat)
    if cat == 'finance'
      Book.tagged_with(%w[finance], any: true).order('created_at DESC')
    elsif cat == "favorites"
      Book.tagged_with(%w[favorites], any:true).order('created_at DESC')
    elsif cat == 'science'
      Book.tagged_with(%w[science], any: true).order('created_at DESC')
    elsif cat == 'technology'
      Book.tagged_with(%w[technology], any: true).order('created_at DESC')
    elsif cat == 'career/life'
      Book.tagged_with(%w[career], any: true).order('created_at DESC')
    elsif cat == 'creativity'
      Book.tagged_with(%w[creativity], any: true).order('created_at DESC')
    elsif cat == 'mindfulness'
      Book.tagged_with(%w[mindfulness], any: true).order('created_at DESC')
    elsif cat == 'history'
      Book.tagged_with(%w[history], any: true).order('created_at DESC')
    elsif cat == 'learning'
      Book.tagged_with(%w[learning], any: true).order('created_at DESC')
    elsif cat == 'psychology'
      Book.tagged_with(%w[psychology], any: true).order('created_at DESC')
    elsif cat == 'communication'
      Book.tagged_with(%w[communication], any: true).order('created_at DESC')
    elsif cat == 'leadership'
      Book.tagged_with(%w[leadership], any: true).order('created_at DESC')
    elsif cat == 'fiction'
      Book.tagged_with(%w[fiction], any: true).order('created_at DESC')
    elsif cat == 'philosophy'
      Book.tagged_with(%w[philosophy], any: true).order('created_at DESC')
    elsif cat == 'biography'
      Book.tagged_with(%w[biography], any: true).order('created_at DESC')
    elsif cat == 'health'
      Book.tagged_with(%w[health], any: true).order('created_at DESC')
    elsif cat == 'self-improvement'
      Book.tagged_with(%w[self-improvement], any: true).order('created_at DESC')
    elsif cat == 'health'
      Book.tagged_with(%w[health], any: true).order('created_at DESC')
    elsif cat == 'reviews'
      Book.tagged_with(%w[reviews], any: true).order('created_at DESC')
    elsif cat == 'entrepreneurship'
      Book.tagged_with(%w[entrepreneurship], any: true).order('created_at DESC')
    elsif cat == 'productivity'
      Book.tagged_with(%w[productivity], any: true).order('created_at DESC')
    elsif cat == 'marketing'
      Book.tagged_with(%w[marketing], any: true).order('created_at DESC')
    elsif cat == 'systems'
      Book.tagged_with(%w[systems], any: true).order('created_at DESC')
    elsif cat == 'social science'
      Book.tagged_with(%w[social-science], any: true).order('created_at DESC')     
    elsif cat == 'success'
      Book.tagged_with(%w[success], any: true).order('created_at DESC')    
    else
      Book.order('created_at DESC')
    end

  # scope :marketing_items, -> { where(topic_id: 3) }
end
end
