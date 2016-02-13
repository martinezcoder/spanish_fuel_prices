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

ActiveRecord::Schema.define(version: 20160213130251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_prices", force: :cascade do |t|
    t.integer "day"
    t.integer "station_id"
    t.integer "biodiesel"
    t.integer "bioetanol"
    t.integer "compressed_natural_gas"
    t.integer "liquefied_natural_gas"
    t.integer "a_diesel"
    t.integer "gasoline_95"
    t.integer "gasoline_98"
    t.integer "new_a_diesel"
    t.integer "bioetanol_per"
    t.integer "methyl_ester_per"
  end

  add_index "day_prices", ["day", "station_id"], name: "index_day_prices_on_day_and_station_id", unique: true, using: :btree
  add_index "day_prices", ["day"], name: "index_day_prices_on_day", using: :btree
  add_index "day_prices", ["station_id"], name: "index_day_prices_on_station_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string  "name"
    t.integer "municipality_id"
  end

  add_index "locations", ["municipality_id"], name: "index_locations_on_municipality_id", using: :btree
  add_index "locations", ["name"], name: "index_locations_on_name", unique: true, using: :btree

  create_table "municipalities", force: :cascade do |t|
    t.string  "name"
    t.integer "province_id"
  end

  add_index "municipalities", ["name"], name: "index_municipalities_on_name", using: :btree
  add_index "municipalities", ["province_id"], name: "index_municipalities_on_province_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string  "name"
    t.integer "ccaa_id"
  end

  add_index "provinces", ["name"], name: "index_provinces_on_name", using: :btree

  create_table "station_data", force: :cascade do |t|
    t.string  "postal_code"
    t.string  "address"
    t.string  "opening_hours"
    t.integer "latitude"
    t.integer "longitud"
    t.string  "location"
    t.string  "municipality"
    t.string  "province"
    t.string  "margin"
    t.string  "remission"
    t.string  "label"
    t.string  "sales_type"
    t.integer "biodiesel"
    t.integer "bioetanol"
    t.integer "compressed_natural_gas"
    t.integer "liquefied_natural_gas"
    t.integer "a_diesel"
    t.integer "gasoline_95"
    t.integer "gasoline_98"
    t.integer "new_a_diesel"
    t.integer "bioetanol_per"
    t.integer "methyl_ester_per"
  end

  create_table "stations", force: :cascade do |t|
    t.string  "postal_code"
    t.string  "address"
    t.string  "opening_hours"
    t.integer "latitude"
    t.integer "longitude"
    t.string  "label"
    t.integer "location_id"
    t.integer "municipality_id"
    t.integer "province_id"
  end

  add_index "stations", ["label", "latitude", "longitude"], name: "index_stations_on_label_and_latitude_and_longitude", unique: true, using: :btree
  add_index "stations", ["label"], name: "index_stations_on_label", using: :btree
  add_index "stations", ["latitude", "longitude"], name: "index_stations_on_latitude_and_longitude", using: :btree
  add_index "stations", ["location_id"], name: "index_stations_on_location_id", using: :btree
  add_index "stations", ["municipality_id"], name: "index_stations_on_municipality_id", using: :btree
  add_index "stations", ["province_id"], name: "index_stations_on_province_id", using: :btree

end
