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

ActiveRecord::Schema.define(version: 2019_06_22_185627) do

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_times", force: :cascade do |t|
    t.integer "origin_id"
    t.integer "destination_id"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["origin_id"], name: "index_flight_times_on_origin_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_number"
    t.integer "departing_id"
    t.integer "arriving_id"
    t.string "day"
    t.string "etd"
    t.string "eta"
    t.string "duration"
    t.string "captain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arriving_id", "day"], name: "index_flights_on_arriving_id_and_day"
    t.index ["departing_id", "day"], name: "index_flights_on_departing_id_and_day"
  end

end
