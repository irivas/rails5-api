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

ActiveRecord::Schema.define(version: 2019_03_26_134041) do

  create_table "audio_qualities", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.integer "position"
    t.boolean "default", default: false
    t.boolean "translated", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audio_qualities_movies", force: :cascade do |t|
    t.integer "audio_quality_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_quality_id", "movie_id"], name: "index_audio_qualities_movies_on_audio_quality_id_and_movie_id", unique: true
    t.index ["audio_quality_id"], name: "index_audio_qualities_movies_on_audio_quality_id"
    t.index ["movie_id"], name: "index_audio_qualities_movies_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "plot"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_qualities", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.integer "position"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_qualities_movies", force: :cascade do |t|
    t.integer "video_quality_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_video_qualities_movies_on_movie_id"
    t.index ["video_quality_id", "movie_id"], name: "index_video_qualities_movies_on_video_quality_id_and_movie_id", unique: true
    t.index ["video_quality_id"], name: "index_video_qualities_movies_on_video_quality_id"
  end

end
