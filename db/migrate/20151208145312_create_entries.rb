class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :e_id
      t.string :title
      t.string :link
      t.text :content

      t.timestamps null: false
    end
  end
end
