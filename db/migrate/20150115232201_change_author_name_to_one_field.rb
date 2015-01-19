class ChangeAuthorNameToOneField < ActiveRecord::Migration
  def change
    remove_column :authors, :first
    remove_column :authors, :last
    add_column :authors, :name, :string
  end
end
