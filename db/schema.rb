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

ActiveRecord::Schema.define(version: 2021_11_21_161351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hours", force: :cascade do |t|
    t.string "hourinterval"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "row"
    t.integer "hour_id"
    t.integer "movie_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seat_1"
    t.integer "seat_2"
    t.integer "seat_3"
    t.integer "seat_4"
    t.integer "seat_5"
    t.integer "seat_6"
    t.integer "seat_7"
    t.integer "seat_8"
    t.integer "seat_9"
    t.integer "seat_10"
    t.integer "seat_11"
    t.integer "seat_12"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.string "number"
    t.integer "room_id"
    t.integer "hour_id"
    t.string "occupied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "show_rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
