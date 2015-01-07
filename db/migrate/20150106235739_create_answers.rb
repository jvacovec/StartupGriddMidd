class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text_excerpt
      t.integer :video_seek_time # seconds since video start
      t.integer :deck_start_slide
      t.integer :confidence
      t.references :question, index: true
      t.references :post, index: true      
      t.timestamps null: false
    end
    add_foreign_key :answers, :question
    add_foreign_key :answers, :post
  end
end
