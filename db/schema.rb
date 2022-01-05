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

ActiveRecord::Schema.define(version: 2022_01_05_080719) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area_name", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_name", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "subject"
    t.text "message", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id", null: false
    t.integer "member_id", null: false
  end

  create_table "hotel_images", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.string "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", null: false
    t.integer "area_id", null: false
    t.string "hotel_name", null: false
    t.string "price_range", null: false
    t.text "caption", null: false
    t.text "website", null: false
    t.string "address", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.text "introduction"
    t.string "profile_image_id"
    t.string "phone_number"
    t.boolean "is_deleted", default: false, null: false
    t.boolean "profile_image_status", default: false, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id", null: false
    t.string "image_name", null: false
  end

  create_table "review_comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "review_id", null: false
    t.integer "member_id", null: false
    t.text "comment", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id", null: false
    t.integer "member_id", null: false
    t.string "title", null: false
    t.text "content"
    t.string "review_image_id"
    t.float "rate", null: false
    t.decimal "content_score", precision: 5, scale: 3
    t.boolean "review_image_status", default: false, null: false
  end

end
