class Topic < ApplicationRecord
  validates_presence_of :title
  has_many :books
  has_many :articles
end
