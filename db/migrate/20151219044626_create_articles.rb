class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.string :summary
      t.string :image_url
      t.text :content
      t.references :feed, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
