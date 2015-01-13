class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :icon_url
      t.references :tag, index: true
      t.timestamps null: false
    end
    # add_foreign_key :tag, :tag
  end
end
