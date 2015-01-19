class AdjustTagForeignKeys < ActiveRecord::Migration
  def change
    remove_column :tags, :tag_id
    add_column :tags, :parent_id, :integer
    add_index :tags, :parent_id
    add_foreign_key :tags, :tags, column: :parent_id
  end
end
