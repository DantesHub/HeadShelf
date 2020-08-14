class AddThumbImageToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :thumb_image, :text
  end
end
