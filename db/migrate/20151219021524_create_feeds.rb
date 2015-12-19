class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :author
      t.string :link
      t.string :source

      t.timestamps null: false
    end
  end
end
