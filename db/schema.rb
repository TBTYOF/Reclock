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

ActiveRecord::Schema.define(version: 2019_09_23_134935) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "on_store_user_id"
    t.integer "order_id"
    t.string "title", null: false
    t.text "body", null: false
    t.boolean "user_read", default: false, null: false
    t.boolean "on_store_user_read", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["on_store_user_id"], name: "index_inquiries_on_on_store_user_id"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "major_categories", force: :cascade do |t|
    t.integer "on_store_user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "middle_categories", force: :cascade do |t|
    t.integer "major_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "minor_categories", force: :cascade do |t|
    t.integer "middle_category_id"
    t.string "name"
    t.string "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "on_store_user_images", force: :cascade do |t|
    t.integer "on_store_user_id"
    t.string "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["on_store_user_id"], name: "index_on_store_user_images_on_on_store_user_id"
  end

  create_table "on_store_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "owner_name", null: false
    t.string "owner_name_kana", null: false
    t.string "shop_name", null: false
    t.string "image_id"
    t.string "business_hours"
    t.string "holiday"
    t.string "telephone_number", null: false
    t.string "postcode", null: false
    t.string "address", null: false
    t.string "closest_station"
    t.string "parking"
    t.text "greeting"
    t.boolean "is_public", default: false, null: false
    t.boolean "is_quit", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_on_store_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_on_store_users_on_reset_password_token", unique: true
  end

  create_table "order_images", force: :cascade do |t|
    t.integer "order_id"
    t.string "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_images_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "on_store_user_id"
    t.integer "serial_number", null: false
    t.integer "variety", null: false
    t.integer "pickup", null: false
    t.string "maker"
    t.string "model"
    t.text "symptom", null: false
    t.integer "repair_status", default: 1, null: false
    t.text "repair_detail"
    t.integer "payment"
    t.integer "charge"
    t.integer "delivery", default: 1, null: false
    t.datetime "delivery_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["on_store_user_id"], name: "index_orders_on_on_store_user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.integer "inquiry_id"
    t.text "body", null: false
    t.boolean "is_writer", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquiry_id"], name: "index_replies_on_inquiry_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "on_store_user_id"
    t.integer "order_id"
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["on_store_user_id"], name: "index_reviews_on_on_store_user_id"
    t.index ["order_id"], name: "index_reviews_on_order_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "telephone_number", null: false
    t.string "postcode", null: false
    t.string "address", null: false
    t.boolean "is_quit", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
