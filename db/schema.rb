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

ActiveRecord::Schema.define(version: 20140620230654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: true do |t|
    t.string   "time",        limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "groups", ["location_id"], name: "index_groups_on_location_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "postcode",   limit: 8
    t.decimal  "lat",                  precision: 8, scale: 6
    t.decimal  "long",                 precision: 9, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["postcode"], name: "index_locations_on_postcode", unique: true, using: :btree

end
