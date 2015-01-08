class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.datetime :date_posted
      t.string :media_type # see if we can make this an enum field
      t.string :quote_1
      t.string :quote_2
      t.string :quote_3
      t.integer :difficulty
      t.integer :technicality
      t.integer :quality
      t.text :summary
      t.string :trackback_url_1
      t.string :trackback_url_2
      t.string :trackback_url_3
      t.references :user, index: true
      t.references :author, index: true
      t.timestamps null: false
    end
    add_foreign_key :posts, :user
    add_foreign_key :author, :user
  end
end
