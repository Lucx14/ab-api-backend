# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_26_112728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string "listing_type", null: false
    t.string "short_description", null: false
    t.string "long_description", null: false
    t.integer "total_occupancy", null: false
    t.integer "total_bedrooms", null: false
    t.integer "total_beds", null: false
    t.string "country", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "house_number", null: false
    t.string "post_code", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.boolean "has_kitchen"
    t.boolean "has_wifi"
    t.boolean "has_tv"
    t.boolean "has_air_con"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "host_id", null: false
    t.index ["host_id"], name: "index_listings_on_host_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "listings", "users", column: "host_id"
end
