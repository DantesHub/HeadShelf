class CreateTitans < ActiveRecord::Migration[5.2]
  def change
    create_table :titans do |t|
      t.string :name
      t.text :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
