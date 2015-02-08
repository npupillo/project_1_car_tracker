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

ActiveRecord::Schema.define(version: 20150208000736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string  "name",        null: false
    t.integer "vehicle_id"
    t.integer "category_id"
    t.integer "vendor_id"
    t.decimal "cost"
    t.date    "event_date"
    t.date    "due_date"
    t.string  "notes"
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree
  add_index "events", ["vehicle_id"], name: "index_events_on_vehicle_id", using: :btree
  add_index "events", ["vendor_id"], name: "index_events_on_vendor_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string  "nickname",      null: false
    t.string  "make",          null: false
    t.string  "model",         null: false
    t.integer "year",          null: false
    t.integer "mileage",       null: false
    t.date    "purchase_date", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name",    null: false
    t.string "address"
    t.string "phone"
    t.string "website"
    t.string "hours"
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "vehicles"
  add_foreign_key "events", "vendors"
end
