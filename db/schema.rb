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

ActiveRecord::Schema.define(version: 2021_12_29_022549) do

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "datetime_of_birth", null: false
    t.integer "sex", null: false
  end

  create_table "pillar_of_days", force: :cascade do |t|
    t.integer "person_id"
    t.integer "tenkan", null: false
    t.integer "chishi", null: false
    t.integer "zoukan", null: false
    t.index ["person_id"], name: "index_pillar_of_days_on_person_id"
  end

  create_table "pillar_of_months", force: :cascade do |t|
    t.integer "person_id"
    t.integer "tenkan", null: false
    t.integer "chishi", null: false
    t.integer "zoukan", null: false
    t.index ["person_id"], name: "index_pillar_of_months_on_person_id"
  end

  create_table "pillar_of_times", force: :cascade do |t|
    t.integer "person_id"
    t.integer "tenkan", null: false
    t.integer "chishi", null: false
    t.integer "zoukan", null: false
    t.index ["person_id"], name: "index_pillar_of_times_on_person_id"
  end

  create_table "pillar_of_years", force: :cascade do |t|
    t.integer "person_id"
    t.integer "tenkan", null: false
    t.integer "chishi", null: false
    t.integer "zoukan", null: false
    t.index ["person_id"], name: "index_pillar_of_years_on_person_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.datetime "division_date", null: false
    t.integer "year"
    t.integer "month"
    t.decimal "seconds"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
