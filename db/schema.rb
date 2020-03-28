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

ActiveRecord::Schema.define(version: 2020_03_28_013426) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "province_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "contry_of_origins", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "city_id"
    t.integer "province_id"
    t.string "phoneNumber"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_customers_on_city_id"
    t.index ["province_id"], name: "index_customers_on_province_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.boolean "new"
    t.float "discount"
    t.integer "country_of_origin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_of_origin_id"], name: "index_drinks_on_country_of_origin_id"
  end

  create_table "ordered_drinks", force: :cascade do |t|
    t.integer "order_id"
    t.integer "drink_id"
    t.decimal "quantity"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drink_id"], name: "index_ordered_drinks_on_drink_id"
    t.index ["order_id"], name: "index_ordered_drinks_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.float "total_cost"
    t.float "gst"
    t.float "pst"
    t.float "hst"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.float "gst"
    t.float "pst"
    t.float "hst"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
