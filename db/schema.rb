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

ActiveRecord::Schema.define(version: 20161201092420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "hstore"

  create_table "authorizations", force: :cascade do |t|
    t.integer  "provider"
    t.string   "uid"
    t.string   "auth_type"
    t.integer  "auth_id"
    t.text     "auth_data"
    t.hstore   "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_type", "auth_id", "provider"], name: "index_authorizations_on_auth_type_and_auth_id_and_provider", using: :btree
    t.index ["auth_type", "auth_id"], name: "index_authorizations_on_auth_type_and_auth_id", using: :btree
    t.index ["provider", "uid"], name: "index_authorizations_on_provider_and_uid", using: :btree
  end

  create_table "game_rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "game_id"
    t.integer  "status"
    t.integer  "limit_player"
    t.hstore   "data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["game_id"], name: "index_game_rooms_on_game_id", using: :btree
    t.index ["owner_id"], name: "index_game_rooms_on_owner_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.hstore "data"
  end

  create_table "spy_game_roles", force: :cascade do |t|
    t.string "name"
    t.string "place"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.integer  "game_room_id"
    t.integer  "spy_game_role_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "avatar"
    t.hstore   "data"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["spy_game_role_id"], name: "index_users_on_spy_game_role_id", using: :btree
  end

end
