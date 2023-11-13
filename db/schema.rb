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

ActiveRecord::Schema[7.1].define(version: 2023_11_13_201851) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_quests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quest_id"
    t.integer "progress"
    t.integer "ranking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_user_quests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quest_id"
    t.integer "progress"
    t.integer "ranking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "institution"
    t.string "degree"
    t.integer "graduation_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.text "cover_letter"
    t.text "resume"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "applied_at"
    t.date "interviewing_at"
    t.date "hired_at"
    t.index ["user_id", "role_id"], name: "index_job_applications_on_user_id_and_role_id", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "image"
    t.text "introduction"
    t.text "resume"
    t.text "about"
    t.text "experience"
    t.string "portfolio_link"
    t.string "cover_letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.text "description"
    t.string "employee_type"
    t.string "location"
    t.decimal "salary", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quest_id"
    t.integer "ranking", default: 0
    t.date "contract_expiration"
    t.index ["company_id", "name"], name: "index_roles_on_company_id_and_name", unique: true
    t.index ["quest_id"], name: "index_roles_on_quest_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "user_quests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "progress", default: 0
    t.integer "ranking", default: 0
    t.index ["quest_id"], name: "index_user_quests_on_quest_id"
    t.index ["user_id"], name: "index_user_quests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role_type"
  end

  add_foreign_key "educations", "users"
  add_foreign_key "job_applications", "roles"
  add_foreign_key "job_applications", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "roles", "companies"
  add_foreign_key "roles", "quests"
  add_foreign_key "skills", "users"
  add_foreign_key "user_quests", "quests"
  add_foreign_key "user_quests", "users"
end
