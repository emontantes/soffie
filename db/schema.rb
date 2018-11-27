ActiveRecord::Schema.define(version: 2018_11_26_152325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_book_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_book_categories_on_category_id"
    t.index ["users_book_id"], name: "index_book_categories_on_users_book_id"
  end

  create_table "book_moods", force: :cascade do |t|
    t.bigint "mood_id"
    t.bigint "users_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mood_id"], name: "index_book_moods_on_mood_id"
    t.index ["users_book_id"], name: "index_book_moods_on_users_book_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
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
    t.string "reading_speed"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "reading_time"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "isbn"
    t.integer "num_pages"
    t.text "description"
    t.string "image_url"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_users_books_on_user_id"
  end

  add_foreign_key "book_categories", "categories"
  add_foreign_key "book_categories", "users_books"
  add_foreign_key "book_moods", "moods"
  add_foreign_key "book_moods", "users_books"
end
