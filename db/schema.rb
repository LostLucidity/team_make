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

ActiveRecord::Schema.define(version: 20151112002020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "remember_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "age"
    t.string   "telephone"
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "club_name"
    t.string   "sport"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "password_digest"
    t.string   "director"
    t.string   "email"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "season_id"
  end

  add_index "clubs", ["season_id"], name: "index_clubs_on_season_id", using: :btree

  create_table "evaluated_athletes", force: :cascade do |t|
    t.integer  "athlete_id"
    t.integer  "tryout_id"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
    t.integer  "tryout_id"
  end

  add_index "seasons", ["club_id"], name: "index_seasons_on_club_id", using: :btree
  add_index "seasons", ["team_id"], name: "index_seasons_on_team_id", using: :btree

  create_table "spots", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "invite_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "athlete_id"
  end

  add_index "spots", ["athlete_id"], name: "index_spots_on_athlete_id", using: :btree
  add_index "spots", ["team_id"], name: "index_spots_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "age_group"
    t.string   "coach"
    t.integer  "roster_size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "season_id"
  end

  create_table "tryouts", force: :cascade do |t|
    t.text     "location"
    t.date     "date"
    t.string   "time"
    t.integer  "price"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tryouts", ["season_id"], name: "index_tryouts_on_season_id", using: :btree

  add_foreign_key "clubs", "seasons"
  add_foreign_key "seasons", "clubs"
  add_foreign_key "seasons", "teams"
  add_foreign_key "spots", "athletes"
  add_foreign_key "spots", "teams"
  add_foreign_key "tryouts", "seasons"
end
