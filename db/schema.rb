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

ActiveRecord::Schema[8.0].define(version: 2025_02_09_010208) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "brands", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "status"
    t.integer "client_id"

    t.unique_constraint ["name"], name: "brands_name_key"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "cnpj"
    t.string "company_name"
    t.string "email"
    t.string "phone"
    t.string "country"
    t.bigint "state"
    t.bigint "city"
    t.string "address"
    t.string "address_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "cnpj"
    t.string "phone"
    t.string "address"
    t.integer "address_number"
    t.string "country"
    t.string "state"
    t.string "city"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "company_contacts", id: :serial, force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "contact_id", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }

    t.unique_constraint ["company_id", "contact_id"], name: "company_contacts_company_id_contact_id_key"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "company_id"
    t.string "role", limit: 20
    t.string "department", limit: 255
    t.check_constraint "role::text = ANY (ARRAY['Consultor'::character varying, 'Assistente'::character varying, 'Analista'::character varying, 'Supervisor'::character varying, 'Coordenador'::character varying, 'Especialista'::character varying, 'Gerente'::character varying, 'Diretor'::character varying, 'CEO'::character varying]::text[])", name: "contacts_role_check"
  end

  create_table "contract_products", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "subtotal_price"
    t.decimal "total_price"
    t.index ["contract_id"], name: "index_contract_products_on_contract_id"
    t.index ["product_id"], name: "index_contract_products_on_product_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "opportunity_id", null: false
    t.decimal "total_price"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["opportunity_id"], name: "index_contracts_on_opportunity_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "description", null: false
    t.integer "license_years", default: 0
    t.integer "license_months", default: 0
    t.integer "license_days", default: 0
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "license_days >= 0 AND license_days <= 31", name: "check_license_days_max"
    t.check_constraint "license_months >= 0 AND license_months <= 12", name: "check_license_months_max"
    t.check_constraint "license_years > 0 OR license_months > 0 OR license_days > 0", name: "check_at_least_one_filled"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "opportunity_company", id: :serial, force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "opportunity_id", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "opportunity_contact", id: :serial, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "opportunity_id", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "opportunity_products", force: :cascade do |t|
    t.bigint "opportunity_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "subtotal_price"
    t.decimal "total_price"
    t.decimal "price", precision: 10, scale: 2
    t.index ["opportunity_id"], name: "index_opportunity_products_on_opportunity_id"
    t.index ["product_id"], name: "index_opportunity_products_on_product_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "plan_name"
    t.boolean "status", default: true
    t.integer "plan_duration"
    t.decimal "plan_price"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_type"
    t.string "description", limit: 200
    t.decimal "price", precision: 10, scale: 2
    t.boolean "status"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "brand_id"
    t.bigint "license_id"
    t.index ["license_id"], name: "index_products_on_license_id"
  end

  create_table "quote_products", force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "subtotal_price"
    t.decimal "total_price"
    t.index ["product_id"], name: "index_quote_products_on_product_id"
    t.index ["quote_id"], name: "index_quote_products_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.bigint "opportunity_id", null: false
    t.decimal "total_price"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["opportunity_id"], name: "index_quotes_on_opportunity_id"
  end

  create_table "sales_order_products", force: :cascade do |t|
    t.bigint "sales_order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "subtotal_price"
    t.decimal "total_price"
    t.index ["product_id"], name: "index_sales_order_products_on_product_id"
    t.index ["sales_order_id"], name: "index_sales_order_products_on_sales_order_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.bigint "opportunity_id", null: false
    t.decimal "total_price"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["opportunity_id"], name: "index_sales_orders_on_opportunity_id"
  end

  create_table "segments", force: :cascade do |t|
    t.string "segment_name"
    t.boolean "status"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string "stage_name"
    t.boolean "status", default: true
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "sub_segments", force: :cascade do |t|
    t.string "sub_segment_name"
    t.boolean "status"
    t.bigint "segment_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["segment_id"], name: "index_sub_segments_on_segment_id"
  end

  create_table "tax_regimes", force: :cascade do |t|
    t.string "tax_regime_name"
    t.boolean "status", default: true
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "brands", "clients", name: "fk_brands_clients", on_delete: :cascade
  add_foreign_key "cities", "states"
  add_foreign_key "clients", "cities", column: "city", name: "fk_city"
  add_foreign_key "clients", "states", column: "state", name: "fk_state"
  add_foreign_key "company_contacts", "companies", name: "fk_company", on_delete: :cascade
  add_foreign_key "company_contacts", "contacts", name: "fk_contact", on_delete: :cascade
  add_foreign_key "contacts", "companies", name: "fk_contacts_company", on_delete: :nullify
  add_foreign_key "contract_products", "contracts"
  add_foreign_key "contract_products", "products"
  add_foreign_key "contracts", "opportunities"
  add_foreign_key "opportunity_company", "companies", name: "opportunity_company_company_id_fkey", on_delete: :cascade
  add_foreign_key "opportunity_company", "opportunities", name: "opportunity_company_opportunity_id_fkey", on_delete: :cascade
  add_foreign_key "opportunity_contact", "contacts", name: "fk_opportunity_contact_contact_id", on_delete: :cascade
  add_foreign_key "opportunity_contact", "opportunities", name: "opportunity_contact_opportunity_id_fkey", on_delete: :cascade
  add_foreign_key "opportunity_products", "opportunities"
  add_foreign_key "opportunity_products", "products"
  add_foreign_key "products", "brands", name: "fk_products_brands", on_delete: :nullify
  add_foreign_key "products", "licenses"
  add_foreign_key "quote_products", "products"
  add_foreign_key "quote_products", "quotes"
  add_foreign_key "quotes", "opportunities"
  add_foreign_key "sales_order_products", "products"
  add_foreign_key "sales_order_products", "sales_orders"
  add_foreign_key "sales_orders", "opportunities"
  add_foreign_key "sub_segments", "segments"
end
