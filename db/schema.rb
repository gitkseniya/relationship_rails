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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_03_27_231753) do
=======
ActiveRecord::Schema.define(version: 2021_03_26_225917) do
>>>>>>> ec7d96e22c4611d91dca0e1fdc42f8fdf21d472f

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.boolean "capital"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.integer "gdp"
    t.boolean "has_monarch"
=======
  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.integer "flight_number"
    t.boolean "domestic_flight"
    t.bigint "airport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_airlines_on_airport_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.integer "terminals"
    t.boolean "international_hub"
>>>>>>> ec7d96e22c4611d91dca0e1fdc42f8fdf21d472f
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
=======
  add_foreign_key "airlines", "airports"
>>>>>>> ec7d96e22c4611d91dca0e1fdc42f8fdf21d472f
end
