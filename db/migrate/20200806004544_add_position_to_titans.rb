class AddPositionToTitans < ActiveRecord::Migration[5.2]
  def change
    add_column :titans, :position, :integer
  end
end
