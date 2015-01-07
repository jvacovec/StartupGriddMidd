class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first
      t.string :last
      t.text :bio
      t.string :linkedin_url
      t.string :angellist_url
      t.string :wikipedia_url
      t.string :title
      t.string :location
      t.timestamps null: false
    end
  end
end
