# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_26_135622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.date "registration_date"
    t.bit "accepted_terms", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_ref"
    t.string "transaction_id"
    t.string "status"
    t.decimal "source_amount"
    t.string "source_currency"
    t.decimal "destination_amount"
    t.string "destination_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.date "transaction_date"
    t.decimal "exchange_rate"
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
    t.index ["transaction_id"], name: "index_transactions_on_transaction_id"
    t.index ["transaction_ref"], name: "index_transactions_on_transaction_ref"
  end

  add_foreign_key "transactions", "customers"
end
