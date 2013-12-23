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

ActiveRecord::Schema.define(version: 20131223033226) do

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  add_index "comments", ["movie_id"], name: "index_comments_on_movie_id"

  create_table "movies", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.text     "actors"
    t.text     "directors"
    t.string   "film_location"
    t.text     "genre"
    t.string   "imdb_id"
    t.text     "plot_simple"
    t.text     "poster"
    t.string   "rated"
    t.decimal  "rating"
    t.string   "runtime"
    t.integer  "release_date"
    t.text     "writers"
  end

end
