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

ActiveRecord::Schema.define(version: 20160817222932) do

  create_table "address_books", force: :cascade do |t|
    t.integer  "address_index"
    t.integer  "user_index"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "shipping_address1"
    t.string   "shipping_address2"
    t.string   "shipping_city"
    t.string   "shipping_country"
    t.string   "shipping_state"
    t.string   "shipping_zip_code"
    t.string   "shipping_first_name"
    t.string   "shipping_last_name"
  end

  create_table "charges", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "sub_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "card_token"
    t.string   "ship_date"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "interval"
    t.string   "stripe_id"
    t.string   "features"
    t.integer  "display_order"
    t.boolean  "highlight"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "stripe_id"
    t.boolean  "admin",           default: false
  end

end
