class AddFieldToTag < ActiveRecord::Migration
  def change
    add_column :tags, :custom, :boolean
  end
end
