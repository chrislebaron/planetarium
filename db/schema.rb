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

ActiveRecord::Schema.define(version: 20150225233936) do

  create_table "moons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "atmosphere"
    t.string   "composition"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "planet_id"
    t.integer  "user_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.decimal  "orbital_speed"
    t.decimal  "volume"
    t.decimal  "mass"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "phone_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "admin"
  end

end
