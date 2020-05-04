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

ActiveRecord::Schema.define(version: 2020_05_01_075617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercices", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "language_id", null: false
    t.string "name"
    t.integer "level"
    t.text "content"
    t.text "code"
    t.float "limit_time"
    t.float "limit_mem"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_exercices_on_category_id"
    t.index ["language_id"], name: "index_exercices_on_language_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.integer "cod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "version"
  end

  create_table "submissions", force: :cascade do |t|
    t.text "code"
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.bigint "exercice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercice_id"], name: "index_submissions_on_exercice_id"
    t.index ["language_id"], name: "index_submissions_on_language_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "submissions_tests", force: :cascade do |t|
    t.bigint "submission_id", null: false
    t.bigint "test_id", null: false
    t.boolean "pass"
    t.float "time_running"
    t.text "output"
    t.text "code_errors"
    t.text "code_warnings"
    t.float "mem_peak"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["submission_id"], name: "index_submissions_tests_on_submission_id"
    t.index ["test_id"], name: "index_submissions_tests_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "exercice_id", null: false
    t.text "input"
    t.text "output"
    t.boolean "visible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercice_id"], name: "index_tests_on_exercice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exercices", "categories"
  add_foreign_key "exercices", "languages"
  add_foreign_key "submissions", "exercices"
  add_foreign_key "submissions", "languages"
  add_foreign_key "submissions", "users"
  add_foreign_key "submissions_tests", "submissions"
  add_foreign_key "submissions_tests", "tests"
  add_foreign_key "tests", "exercices"
end
