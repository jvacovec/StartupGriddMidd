# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150114185920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "text_excerpt"
    t.integer  "video_seek_time"
    t.integer  "deck_start_slide"
    t.integer  "confidence"
    t.integer  "question_id"
    t.integer  "post_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "answers", ["post_id"], name: "index_answers_on_post_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.text     "bio"
    t.string   "linkedin_url"
    t.string   "angellist_url"
    t.string   "wikipedia_url"
    t.string   "title"
    t.string   "location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "authors_posts", id: false, force: :cascade do |t|
    t.integer "post_id",   null: false
    t.integer "author_id", null: false
  end

  add_index "authors_posts", ["author_id"], name: "index_authors_posts_on_author_id", using: :btree
  add_index "authors_posts", ["post_id"], name: "index_authors_posts_on_post_id", using: :btree

  create_table "google_credentials", force: :cascade do |t|
    t.string   "credentials"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "date_posted"
    t.string   "media_type"
    t.string   "quote_1"
    t.string   "quote_2"
    t.string   "quote_3"
    t.integer  "difficulty"
    t.integer  "technicality"
    t.integer  "quality"
    t.text     "summary"
    t.string   "trackback_url_1"
    t.string   "trackback_url_2"
    t.string   "trackback_url_3"
    t.integer  "user_id"
    t.integer  "author_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "reference_url_1"
    t.string   "reference_url_2"
    t.string   "reference_url_3"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "tag_id",  null: false
    t.integer "post_id", null: false
  end

  add_index "posts_tags", ["post_id"], name: "index_posts_tags_on_post_id", using: :btree
  add_index "posts_tags", ["tag_id"], name: "index_posts_tags_on_tag_id", using: :btree

  create_table "posts_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
  end

  add_index "posts_users", ["post_id"], name: "index_posts_users_on_post_id", using: :btree
  add_index "posts_users", ["user_id"], name: "index_posts_users_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions_tags", id: false, force: :cascade do |t|
    t.integer "tag_id",      null: false
    t.integer "question_id", null: false
  end

  add_index "questions_tags", ["question_id"], name: "index_questions_tags_on_question_id", using: :btree
  add_index "questions_tags", ["tag_id"], name: "index_questions_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "icon_url"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["tag_id"], name: "index_tags_on_tag_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first"
    t.string   "last"
    t.boolean  "is_reviewer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
