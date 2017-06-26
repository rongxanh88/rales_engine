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

ActiveRecord::Schema.define(version: 20170626233703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.bigint "quantity"
    t.bigint "unit_price"
    t.bigint "items_id"
    t.bigint "invoices_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoices_id"], name: "index_invoice_items_on_invoices_id"
    t.index ["items_id"], name: "index_invoice_items_on_items_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.text "status"
    t.bigint "merchants_id"
    t.bigint "customers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_invoices_on_customers_id"
    t.index ["merchants_id"], name: "index_invoices_on_merchants_id"
  end

  create_table "items", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.bigint "unit_price"
    t.bigint "merchants_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchants_id"], name: "index_items_on_merchants_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "credit_card_number"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "invoice_id"
    t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
  end

  add_foreign_key "invoice_items", "invoices", column: "invoices_id"
  add_foreign_key "invoice_items", "items", column: "items_id"
  add_foreign_key "invoices", "customers", column: "customers_id"
  add_foreign_key "invoices", "merchants", column: "merchants_id"
  add_foreign_key "items", "merchants", column: "merchants_id"
  add_foreign_key "transactions", "invoices"
end
