class AddPostFields < ActiveRecord::Migration
  def change
    add_column :posts, :reference_url_1, :string
    add_column :posts, :reference_url_2, :string
    add_column :posts, :reference_url_3, :string
  end
end