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

ActiveRecord::Schema.define(version: 2019_07_02_163748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trip_id"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "journals", force: :cascade do |t|
    t.text "entry"
    t.integer "user_id"
    t.integer "destination_id"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_journals_on_destination_id"
    t.index ["user_id", "destination_id"], name: "index_journals_on_user_id_and_destination_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
