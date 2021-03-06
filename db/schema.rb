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

ActiveRecord::Schema.define(version: 20200605150226) do

  create_table "complaints", force: :cascade do |t|
    t.string "user"
    t.string "invoice"
    t.string "part"
    t.integer "part_count"
    t.string "issue"
    t.date "issue_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "lot"
    t.string "order"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "badge"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitems", force: :cascade do |t|
    t.string "invoice_numb"
    t.string "part_code"
    t.string "part_desc"
    t.decimal "qty"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "order_numb"
    t.string "lot"
  end

  create_table "order_temps", force: :cascade do |t|
    t.string "order_numb"
    t.decimal "temperature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "ordheads", force: :cascade do |t|
    t.string "order_numb"
    t.string "rel_numb"
    t.string "cust_code"
    t.string "cust_name"
    t.string "cust_po"
    t.string "return_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orditems", force: :cascade do |t|
    t.string "order_numb"
    t.string "part_code"
    t.string "part_desc"
    t.decimal "qty"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer "refusal_id"
    t.string "part_code"
    t.string "part_desc"
    t.string "uom"
    t.decimal "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "invoice_qty"
    t.string "reason"
  end

  create_table "refusals", force: :cascade do |t|
    t.string "invoice_numb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "truck"
  end

  create_table "return_parts", force: :cascade do |t|
    t.integer "return_id"
    t.string "part_code"
    t.string "part_desc"
    t.decimal "qty"
    t.string "uom"
    t.decimal "order_qty"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "temperature"
  end

  create_table "returns", force: :cascade do |t|
    t.string "order_numb"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "truck"
  end

  create_table "routes", force: :cascade do |t|
    t.date "dueout_date"
    t.string "order_numb"
    t.string "cust_code"
    t.string "shipto_code"
    t.string "shipname"
    t.string "route_code"
    t.float "stop_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.string "truck_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
