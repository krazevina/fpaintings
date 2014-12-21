class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :title
      t.references :artist, index: true
      t.text :body
      t.string :year
      t.string :material
      t.string :location
      t.string :image
      t.references :category, index: true

      t.timestamps
    end
  end
end
