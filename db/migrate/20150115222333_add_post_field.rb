class AddPostField < ActiveRecord::Migration
  def change
    add_column :posts, :csv_row, :integer, null: true
  end
end
