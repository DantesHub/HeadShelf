class AddSlugToTitans < ActiveRecord::Migration[5.2]
  def change
    add_column :titans, :slug, :string
    add_index :titans, :slug, unique: true
  end
end
