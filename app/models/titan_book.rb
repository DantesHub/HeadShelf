class TitanBook < ApplicationRecord
  belongs_to :titan
  validates_presence_of :name, :link
end
