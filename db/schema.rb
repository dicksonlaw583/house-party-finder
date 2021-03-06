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

ActiveRecord::Schema.define(version: 20140808011804) do

  create_table "album_attachments", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "party_id"
  end

  add_index "album_attachments", ["party_id"], name: "index_album_attachments_on_party_id"

  create_table "attendances", force: true do |t|
    t.integer  "user_id"
    t.integer  "party_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "description"
    t.datetime "posted_date",         default: '2014-08-07 02:47:20'
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "ended",               default: false
    t.datetime "featured_until"
    t.boolean  "streaming"
    t.boolean  "private"
    t.boolean  "food_provided"
    t.boolean  "alcohol"
    t.boolean  "parking"
    t.boolean  "adult_only"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "host_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "parties", ["host_id"], name: "index_parties_on_host_id"

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "party_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "subscriber_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "join_date"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
