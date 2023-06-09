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

ActiveRecord::Schema.define(version: 20230512071438) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "roles",         limit: 255
    t.string   "date_of_birth", limit: 255
    t.string   "dob",           limit: 255
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "doctors", force: :cascade do |t|
    t.string   "roles",      limit: 255
    t.integer  "comment_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "doctors", ["comment_id"], name: "index_doctors_on_comment_id", using: :btree

  create_table "employee_roles", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.integer  "role_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "employee_roles", ["employee_id"], name: "index_employee_roles_on_employee_id", using: :btree
  add_index "employee_roles", ["role_id"], name: "index_employee_roles_on_role_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "gender",     limit: 255
    t.string   "contact_no", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "roles",      limit: 255
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "hospitals", ["patient_id"], name: "index_hospitals_on_patient_id", using: :btree

  create_table "hospitals_patients", id: false, force: :cascade do |t|
    t.integer "patient_id",  limit: 4, null: false
    t.integer "hospital_id", limit: 4, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "bike",       limit: 255
    t.string   "price",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "roles",      limit: 255
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "managers", ["patient_id"], name: "index_managers_on_patient_id", using: :btree

  create_table "patient_hospitals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "contactno",  limit: 255
    t.string   "gender",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "role",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "gender",          limit: 255
    t.integer  "age",             limit: 4
    t.string   "email",           limit: 255
    t.string   "present_address", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "phone_no",        limit: 255
    t.string   "address",         limit: 255
  end

  add_foreign_key "comments", "users"
  add_foreign_key "doctors", "comments"
  add_foreign_key "employee_roles", "employees"
  add_foreign_key "employee_roles", "roles"
  add_foreign_key "hospitals", "patients"
  add_foreign_key "managers", "patients"
  add_foreign_key "products", "users"
end
