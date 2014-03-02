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

ActiveRecord::Schema.define(version: 20140227041246) do

  create_table "actor_overrides", force: true do |t|
    t.string   "full"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "actor_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actors", force: true do |t|
    t.string   "full"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_name"
  end

  create_table "actors_movies", id: false, force: true do |t|
    t.integer "movie_id_id"
    t.integer "movie_id"
    t.integer "actor_id"
  end

  create_table "actors_roles", id: false, force: true do |t|
    t.integer "actor_id"
    t.integer "role_id"
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  add_index "comments", ["movie_id"], name: "index_comments_on_movie_id"

  create_table "genres", force: true do |t|
    t.string   "genre"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres_movies", id: false, force: true do |t|
    t.integer "genre_id"
    t.integer "movie_id"
  end

  create_table "movie_overrides", force: true do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.text    "directors"
    t.string  "film_location"
    t.string  "imdb_id"
    t.text    "plot_simple"
    t.text    "poster"
    t.string  "rated"
    t.decimal "rating"
    t.string  "runtime"
    t.integer "release_date"
    t.text    "writers"
    t.string  "title"
    t.integer "year"
    t.string  "imdb_url"
  end

  create_table "movie_prefs", force: true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.boolean  "dvd"
    t.boolean  "bluray"
    t.boolean  "digital"
    t.integer  "personal_rating"
    t.string   "location"
    t.string   "lent_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.text     "actors_list"
    t.text     "directors"
    t.string   "film_location"
    t.text     "genre_list"
    t.string   "imdb_id"
    t.text     "plot_simple"
    t.text     "poster"
    t.string   "rated"
    t.decimal  "rating"
    t.string   "runtime"
    t.integer  "release_date"
    t.text     "writers"
    t.string   "imdb_url"
  end

  create_table "movies_users", id: false, force: true do |t|
    t.integer "movie_id"
    t.integer "user_id"
  end

  create_table "roles", force: true do |t|
    t.string   "full"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "movie"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "actor_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
