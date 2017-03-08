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

ActiveRecord::Schema.define(version: 20170215010840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body",                       null: false
    t.boolean  "deleted",    default: false, null: false
    t.integer  "event_id",                   null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "event_games", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                       null: false
    t.text     "description",                 null: false
    t.date     "date",                        null: false
    t.time     "time",                        null: false
    t.integer  "limit",                       null: false
    t.boolean  "deleted",     default: false, null: false
    t.integer  "user_id",                     null: false
    t.integer  "venue_id",                    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name",       limit: 30, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "reports", force: :cascade do |t|
    t.text     "content",                null: false
    t.string   "name"
    t.string   "email"
    t.integer  "topic",      default: 1, null: false
    t.integer  "status",     default: 0, null: false
    t.integer  "user_id"
    t.integer  "venue_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "review_vibes", force: :cascade do |t|
    t.integer  "review_id",  null: false
    t.integer  "vibe_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content",    limit: 500,                 null: false
    t.string   "week",       limit: 15
    t.integer  "rating",                                 null: false
    t.boolean  "deleted",                default: false, null: false
    t.integer  "venue_id",                               null: false
    t.integer  "user_id",                                null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_venues", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                         null: false
    t.string   "last_name",                          null: false
    t.string   "user_name",                          null: false
    t.string   "password_digest",                    null: false
    t.string   "email",                              null: false
    t.date     "birthday",                           null: false
    t.text     "bio"
    t.boolean  "deleted",            default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "venue_games", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venue_games", ["game_id", "venue_id"], name: "index_venue_games_on_game_id_and_venue_id", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "address",                         null: false
    t.string   "place"
    t.string   "lat",                             null: false
    t.string   "lng",                             null: false
    t.boolean  "deleted",         default: false, null: false
    t.integer  "neighborhood_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "vibes", force: :cascade do |t|
    t.string   "name",       limit: 20, null: false
    t.string   "pic"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
