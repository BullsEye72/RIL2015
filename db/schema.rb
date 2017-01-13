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

ActiveRecord::Schema.define(version: 20170113130946) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "article_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "article_group_id"
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "article_groups", ["article_group_id"], name: "index_article_groups_on_article_group_id"

  create_table "articles", force: :cascade do |t|
    t.string   "name"
    t.integer  "article_group_id"
    t.integer  "value_added_tax_id"
    t.string   "reference"
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "articles", ["article_group_id"], name: "index_articles_on_article_group_id"
  add_index "articles", ["value_added_tax_id"], name: "index_articles_on_value_added_tax_id"

  create_table "construction_states", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "construction_states_quotes", id: false, force: :cascade do |t|
    t.integer "construction_states_id"
    t.integer "quotes_id"
  end

  add_index "construction_states_quotes", ["construction_states_id"], name: "index_construction_states_quotes_on_construction_states_id"
  add_index "construction_states_quotes", ["quotes_id"], name: "index_construction_states_quotes_on_quotes_id"

  create_table "contents", force: :cascade do |t|
    t.string   "code",       null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contents", ["code"], name: "index_contents_on_code", unique: true

  create_table "customers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "address"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "margins", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "margins_quotes", id: false, force: :cascade do |t|
    t.integer "margins_id"
    t.integer "quotes_id"
  end

  add_index "margins_quotes", ["margins_id"], name: "index_margins_quotes_on_margins_id"
  add_index "margins_quotes", ["quotes_id"], name: "index_margins_quotes_on_quotes_id"

  create_table "orders", force: :cascade do |t|
    t.decimal  "total_due_calc"
    t.integer  "supplier_id"
    t.integer  "quote_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["quote_id"], name: "index_orders_on_quote_id"
  add_index "orders", ["supplier_id"], name: "index_orders_on_supplier_id"

  create_table "pages", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "code"
    t.text     "content",    null: false
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.string   "slug"
  end

  add_index "pages", ["ancestry"], name: "index_pages_on_ancestry"
  add_index "pages", ["code"], name: "index_pages_on_code"

  create_table "parameters", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parameters", ["code"], name: "index_parameters_on_code", unique: true

  create_table "payment_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "quote_id"
    t.decimal  "payment"
    t.integer  "payment_state_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "payments", ["payment_state_id"], name: "index_payments_on_payment_state_id"
  add_index "payments", ["quote_id"], name: "index_payments_on_quote_id"

  create_table "projects", force: :cascade do |t|
    t.string   "description"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
  end

  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id"

  create_table "quote_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "quotes", ["project_id"], name: "index_quotes_on_project_id"
  add_index "quotes", ["user_id"], name: "index_quotes_on_user_id"

  create_table "quotes_quote_states", id: false, force: :cascade do |t|
    t.integer "quotes_id"
    t.integer "quote_states_id"
  end

  add_index "quotes_quote_states", ["quote_states_id"], name: "index_quotes_quote_states_on_quote_states_id"
  add_index "quotes_quote_states", ["quotes_id"], name: "index_quotes_quote_states_on_quotes_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "seos", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "page_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "seos", ["page_id"], name: "index_seos_on_page_id"

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "siret"
    t.string   "fax_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "adress"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone_number"
    t.datetime "deleted_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "value_added_taxes", force: :cascade do |t|
    t.decimal  "value"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
