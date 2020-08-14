class Article < ApplicationRecord
  acts_as_taggable_on :tags
  enum status: { draft: 0, published: 1 }
  validates_presence_of :title, :body
  after_initialize :set_defaults
  # friendly_id :title, use: :slugged

  mount_uploader :thumb_image, ArticleUploader

  def set_defaults; end

  def self.finance; end

  def self.recent
    order('created_at DESC')
  end

  def self.category(cat)
    if cat == 'finance'
      Article.tagged_with(%w[finance], any: true).order('created_at DESC')
    elsif cat == 'science'
      Article.tagged_with(%w[science], any: true).order('created_at DESC')
    elsif cat == 'health'
      Article.tagged_with(%w[health], any: true).order('created_at DESC')
    elsif cat == 'self-improvement'
      Article.tagged_with(%w[self-improvement], any: true).order('created_at DESC')
    elsif cat == 'health'
      Article.tagged_with(%w[health], any: true).order('created_at DESC')
    elsif cat == 'reviews'
      Article.tagged_with(%w[reviews], any: true).order('created_at DESC')
    elsif cat == 'entrepreneurship'
      Article.tagged_with(%w[entrepreneurship], any: true).order('created_at DESC')
    elsif cat == 'productivity'
      Article.tagged_with(%w[productivity], any: true).order('created_at DESC')
    elsif cat == 'marketing'
      Article.tagged_with(%w[marketing], any: true).order('created_at DESC')
    elsif cat == 'systems'
      Article.tagged_with(%w[systems], any: true).order('created_at DESC')
    else
      order('created_at DESC')
    end
end
end
