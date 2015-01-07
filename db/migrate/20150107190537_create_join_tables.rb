class CreateJoinTables < ActiveRecord::Migration
  def change
    create_join_table :tags, :questions do |t|
      t.index :tag_id
      t.index :question_id
    end
    create_join_table :users, :posts do |t|
      t.index :post_id
      t.index :user_id
    end
    create_join_table :posts, :authors do |t|
      t.index :post_id
      t.index :author_id
    end
    create_join_table :tags, :posts do |t|
      t.index :tag_id
      t.index :post_id
    end
  end
end
