class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :born
      t.string :died
      t.string :nationality
      t.string :field
      t.text :intro

      t.timestamps
    end
  end
end
