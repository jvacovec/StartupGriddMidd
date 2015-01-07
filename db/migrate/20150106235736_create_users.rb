class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :first
      t.string :last
      t.boolean :is_reviewer
      t.timestamps null: false
    end
  end
end
