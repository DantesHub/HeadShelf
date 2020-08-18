class CreateTitanBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :titan_books do |t|
      t.string :name
      t.string :link
      t.references :titan, foreign_key: true

      t.timestamps
    end
  end
end
