class AddPreviewToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :preview, :string
  end
end
