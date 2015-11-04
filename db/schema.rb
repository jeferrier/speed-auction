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

ActiveRecord::Schema.define(version: 20151104004845) do

  create_table "admins", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "session_expires"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auctions", force: true do |t|
    t.integer  "item_id"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.float    "current_bid"
    t.string   "bidder_id"
    t.boolean  "flagged"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auctions", ["item_id"], name: "index_auctions_on_item_id"

  create_table "billing_infos", force: true do |t|
    t.integer  "payment_detail_id"
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "billing_infos", ["payment_detail_id"], name: "index_billing_infos_on_payment_detail_id"

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.float    "starting_price"
    t.float    "buyout_price"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "delivered"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "headline_image_file_name"
    t.string   "headline_image_content_type"
    t.integer  "headline_image_file_size"
    t.datetime "headline_image_updated_at"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "payment_details", force: true do |t|
    t.integer  "user_id"
    t.boolean  "credit_card"
    t.string   "credit_card_number"
    t.string   "credit_card_expiration_date"
    t.string   "credit_card_security_code"
    t.boolean  "paypal"
    t.string   "paypal_email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_details", ["user_id"], name: "index_payment_details_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "session_expires"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
