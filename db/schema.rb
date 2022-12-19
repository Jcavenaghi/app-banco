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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_175815) do
  create_table "admin_users", force: :cascade do |t|
    t.integer "branch_office_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_office_id"], name: "index_admin_users_on_branch_office_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "branch_offices", force: :cascade do |t|
    t.string "name", null: false
    t.string "direc", null: false
    t.integer "tel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.integer "day_name", null: false
    t.time "begin_turn", null: false
    t.time "end_turn", null: false
    t.integer "branch_office_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_office_id"], name: "index_days_on_branch_office_id"
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "fecha", null: false
    t.string "reason", null: false
    t.boolean "state", default: false
    t.string "comment"
    t.integer "client_user_id", null: false
    t.integer "staff_user_id"
    t.integer "branch_office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_office_id"], name: "index_turns_on_branch_office_id"
    t.index ["client_user_id"], name: "index_turns_on_client_user_id"
    t.index ["staff_user_id"], name: "index_turns_on_staff_user_id"
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

  add_foreign_key "days", "branch_offices"
  add_foreign_key "turns", "admin_users", column: "staff_user_id"
  add_foreign_key "turns", "branch_offices"
  add_foreign_key "turns", "users", column: "client_user_id"
end
