class AddTopicReferenceToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :topic, foreign_key: true
  end
end
