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

ActiveRecord::Schema.define(version: 20141101040105) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ambassador_applications", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "year"
    t.string   "branch"
    t.string   "college"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
    t.string   "fa_icon"
  end

  create_table "classifieds", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "college_id"
    t.integer  "category_id"
    t.string   "price"
    t.boolean  "list",         default: true
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_type"
    t.boolean  "sold",         default: false
    t.string   "image"
    t.boolean  "spam",         default: false
    t.boolean  "deleted",      default: false
    t.boolean  "fake"
  end

  create_table "colleges", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "zipcode"
    t.string   "city"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude"
    t.string   "longitude"
    t.boolean  "active",     default: true
  end

  create_table "orders", force: true do |t|
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "classified_id"
    t.integer  "handler_id"
    t.integer  "college_id"
    t.integer  "status",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_ambassadors", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "year"
    t.string   "branch"
    t.string   "college"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: ""
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "college_id"
    t.string   "name"
    t.string   "token"
    t.boolean  "active",                 default: true
    t.string   "mobile"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_token_expires_at"
    t.integer  "role"
    t.boolean  "fake"
  end

  add_index "users", ["mobile"], name: "index_users_on_mobile", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
