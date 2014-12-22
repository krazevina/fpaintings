class CreateSubpages < ActiveRecord::Migration
  def change
    create_table :subpages do |t|
      t.string :pagename
      t.text :text

      t.timestamps
    end
  end
end
