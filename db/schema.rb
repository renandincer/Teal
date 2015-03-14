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

ActiveRecord::Schema.define(version: 20150314215001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "listens"
    t.integer  "episode_id"
  end

  add_index "airings", ["episode_id"], name: "index_airings_on_episode_id", using: :btree

  create_table "djs", force: :cascade do |t|
    t.string "net_id"
    t.string "email"
    t.string "name"
    t.string "real_name"
    t.text   "description"
  end

  create_table "djs_episodes", id: false, force: :cascade do |t|
    t.integer "dj_id",      null: false
    t.integer "episode_id", null: false
  end

  create_table "djs_shows", id: false, force: :cascade do |t|
    t.integer "dj_id",   null: false
    t.integer "show_id", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.string  "name"
    t.string  "recording_url"
    t.boolean "downloadable"
    t.integer "online_listens"
  end

  create_table "episodes_songs", id: false, force: :cascade do |t|
    t.integer "song_id",            null: false
    t.integer "episode_id",         null: false
    t.integer "seconds_from_start"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.text   "description"
  end

  create_table "songs", force: :cascade do |t|
    t.string "artist"
    t.string "title"
  end

end
