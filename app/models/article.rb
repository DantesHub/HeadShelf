class Article < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  validates_presence_of :title, :body
  after_initialize :set_defaults

  def set_defaults; end
end
