class TitanBook < ApplicationRecord
  belongs_to :titan
  validates_presence_of :name, :link
  mount_uploader :name, TitanBookUploader
end
