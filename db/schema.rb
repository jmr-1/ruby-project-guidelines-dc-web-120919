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

ActiveRecord::Schema.define(version: 20191230221455) do

  create_table "collections", force: :cascade do |t|
    t.string  "name"
    t.integer "game_id"
    t.integer "user_id"
    t.boolean "favorite"
  end

  create_table "games", force: :cascade do |t|
    t.string  "name"
    t.integer "max_players"
    t.integer "min_players"
    t.integer "min_playtime"
    t.integer "max_playtime"
    t.float   "price"
    t.integer "reddit_all_time_count"
    t.integer "average_user_rating"
    t.integer "year_published"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

end
