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

ActiveRecord::Schema.define(version: 20141102155234) do

  create_table "countries", force: true do |t|
    t.string   "name",               limit: 100, null: false
    t.string   "CountryCode3letter", limit: 3
    t.string   "CountryCode2letter", limit: 2
    t.string   "status",             limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "code",       limit: 3
    t.string   "name",       limit: 75, null: false
    t.string   "status",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "email",                  null: false
    t.string   "FirstName",  limit: 100, null: false
    t.string   "LastName",   limit: 100, null: false
    t.string   "imei",       limit: 100, null: false
    t.integer  "Country_id"
    t.string   "Status",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "description",   limit: 150,                                        null: false
    t.string   "imageurl",                                                         null: false
    t.integer  "currency_id",                                                      null: false
    t.integer  "country_id",                                                       null: false
    t.decimal  "price",                     precision: 10, scale: 2, default: 0.0, null: false
    t.string   "deliveryterms", limit: 500
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "securities", force: true do |t|
    t.integer  "Customer_id"
    t.string   "username",               null: false
    t.string   "password",    limit: 75, null: false
    t.string   "status",      limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
