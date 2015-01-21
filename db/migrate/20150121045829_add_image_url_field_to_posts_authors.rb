class AddImageUrlFieldToPostsAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :image_url, :string
    add_column :posts, :image_url, :string
  end
end
