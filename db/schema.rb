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

ActiveRecord::Schema.define(version: 20160226193549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "channels", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "slack_channel_id", null: false
    t.string   "name",             null: false
    t.uuid     "team_id",          null: false
  end

  add_index "channels", ["team_id"], name: "index_channels_on_team_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "pull_requests", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "approved_at"
    t.string   "link",        null: false
    t.string   "message",     null: false
    t.uuid     "team_id",     null: false
    t.uuid     "channel_id",  null: false
    t.uuid     "user_id",     null: false
  end

  add_index "pull_requests", ["channel_id"], name: "index_pull_requests_on_channel_id", using: :btree
  add_index "pull_requests", ["team_id"], name: "index_pull_requests_on_team_id", using: :btree
  add_index "pull_requests", ["user_id"], name: "index_pull_requests_on_user_id", using: :btree

  create_table "teams", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "slack_team_id", null: false
    t.string   "domain",        null: false
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "slack_user_id", null: false
    t.string   "name",          null: false
    t.uuid     "team_id",       null: false
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  add_foreign_key "channels", "teams"
  add_foreign_key "pull_requests", "channels"
  add_foreign_key "pull_requests", "teams"
  add_foreign_key "pull_requests", "users"
  add_foreign_key "users", "teams"
end
