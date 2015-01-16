class AddFieldsToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :start_excerpt, :string
    add_column :answers, :end_excerpt, :string
  end
end
