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

ActiveRecord::Schema.define(version: 0) do

  create_table "items", force: :cascade do |t|
    t.text    "seller"
    t.text    "sku"
    t.integer "quantity"
    t.text    "status"
    t.text    "location"
  end

  create_table "sellers", force: :cascade do |t|
    t.text "account"
    t.text "password"
  end

  create_table "urls", force: :cascade do |t|
    t.text    "original"
    t.text    "tinyurl"
    t.integer "user_id"
    t.integer "timeUsed"
    t.text    "lastVisitedTime"
    t.index ["user_id"], name: "index_urls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "seller"
    t.text "account"
    t.text "password"
    t.text "APIkey"
  end

end
