class AddTaglistToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :tag_list, :string
  end
end
