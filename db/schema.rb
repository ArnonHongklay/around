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

ActiveRecord::Schema.define(version: 20160406144828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloggy_posts", force: :cascade do |t|
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "published_at"
  end

  add_index "bloggy_posts", ["url"], name: "index_bloggy_posts_on_url", unique: true, using: :btree

  create_table "bloggy_taggings", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "bloggy_taggings", ["post_id"], name: "index_bloggy_taggings_on_post_id", using: :btree
  add_index "bloggy_taggings", ["tag_id"], name: "index_bloggy_taggings_on_tag_id", using: :btree

  create_table "bloggy_tags", force: :cascade do |t|
    t.string "name"
  end

  add_index "bloggy_tags", ["name"], name: "index_bloggy_tags_on_name", using: :btree

  create_table "bloggy_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "published_at"
  end

  add_index "posts", ["url"], name: "index_posts_on_url", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "taggings", ["post_id"], name: "index_taggings_on_post_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
