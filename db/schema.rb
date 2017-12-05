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

ActiveRecord::Schema.define(version: 20170929081509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "pseudo", default: "", null: false
    t.string "server", default: "", null: false
    t.string "category", default: "", null: false
    t.string "role"
    t.integer "level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "user_leader"
    t.string "name", default: "", null: false
    t.integer "minp", default: 0, null: false
    t.integer "maxp", default: 8, null: false
    t.string "server", default: "", null: false
    t.boolean "fight_type", default: false, null: false
    t.integer "levelp", default: 0, null: false
    t.integer "range", default: 10, null: false
    t.integer "levelpmin", default: 0, null: false
    t.integer "levelpmax", default: 200, null: false
    t.integer "organizations_count", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_groups_on_status"
  end

  create_table "organizations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_organizations_on_group_id"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "username", default: "", null: false
    t.boolean "unsubscribe", default: false, null: false
    t.boolean "ban", default: false, null: false
    t.datetime "ban_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "organizations", "groups"
  add_foreign_key "organizations", "users"
end
