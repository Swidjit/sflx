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

ActiveRecord::Schema.define(version: 20171128173151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
  end

  create_table "counties", force: :cascade do |t|
    t.string "county"
  end

  create_table "listings", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.string "city"
    t.integer "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "active", default: false
    t.integer "user_id"
    t.string "slug"
    t.string "county"
    t.integer "place_id"
  end

  create_table "listings_lists", id: false, force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "listing_id", null: false
    t.index ["list_id", "listing_id"], name: "index_listings_lists_on_list_id_and_listing_id"
    t.index ["listing_id", "list_id"], name: "index_listings_lists_on_listing_id_and_list_id"
  end

  create_table "lists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "category_id"
    t.boolean "approved", default: true
    t.string "slug"
  end

  create_table "places", force: :cascade do |t|
    t.string "zipcode"
    t.string "city"
    t.integer "county_id"
  end

  create_table "slugs", force: :cascade do |t|
  end

  create_table "tag_suggestions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "listing_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.boolean "active", default: true
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.boolean "active", default: true
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
