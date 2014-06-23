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

ActiveRecord::Schema.define(version: 20140623203113) do

  create_table "articles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "head"
    t.text     "body"
    t.text     "subhead"
    t.integer  "section_id"
  end

  create_table "memberships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "user_id"
    t.boolean  "is_leader",       default: false, null: false
    t.integer  "position_id"
  end

  create_table "nms_configs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.string   "value"
  end

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "positions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "organization_id"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
    t.string   "lname"
    t.boolean  "is_active"
    t.integer  "RIN"
    t.integer  "avatar_id"
    t.integer  "year"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "remember_me"
    t.string   "encrypted_password"
    t.integer  "sign_in_count",         default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.boolean  "is_admin",              default: false, null: false
  end

end
