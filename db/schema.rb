# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_18_120525) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.integer "posts_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "post_id"
    t.integer "user_id"
    t.text "content"
    t.integer "likes_count", default: 0
    t.integer "reports_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_comments_on_parent_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type"
    t.integer "followable_id"
    t.string "follower_type"
    t.integer "follower_id"
    t.boolean "blocked", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followable_id", "followable_type"], name: "index_follows_on_followable_id_and_followable_type"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable"
    t.index ["follower_id", "follower_type"], name: "index_follows_on_follower_id_and_follower_type"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.string "likeable_type"
    t.integer "likeable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "actor_id"
    t.string "notifiable_type"
    t.integer "notifiable_id"
    t.boolean "unread", default: true
    t.text "payload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_notifications_on_actor_id"
    t.index ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "post_hits", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.string "ip_address"
    t.string "device_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_post_hits_on_post_id"
    t.index ["user_id"], name: "index_post_hits_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "category_id"
    t.integer "team_id"
    t.integer "user_id"
    t.string "nanoid"
    t.string "title"
    t.text "body"
    t.boolean "archived", default: false
    t.integer "reactions_count", default: 0
    t.integer "comments_count", default: 0
    t.integer "reports_count", default: 0
    t.integer "hits_count", default: 0
    t.datetime "published_at"
    t.datetime "trashed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["nanoid"], name: "index_posts_on_nanoid", unique: true
    t.index ["published_at"], name: "index_posts_on_published_at"
    t.index ["team_id"], name: "index_posts_on_team_id"
    t.index ["trashed_at"], name: "index_posts_on_trashed_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.integer "kind", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_reactions_on_post_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id"
    t.string "reportable_type"
    t.integer "reportable_id"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "team_users", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.integer "state", default: 0
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_teams_on_slug", unique: true
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "avatar"
    t.string "password_digest"
    t.string "refresh_token"
    t.string "username"
    t.string "name"
    t.text "bio"
    t.integer "followers_count", default: 0
    t.integer "following_count", default: 0
    t.integer "posts_count", default: 0
    t.integer "role", default: 0
    t.integer "plan", default: 0
    t.datetime "plan_due_at"
    t.datetime "trashed_at"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["refresh_token"], name: "index_users_on_refresh_token", unique: true
    t.index ["trashed_at"], name: "index_users_on_trashed_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
