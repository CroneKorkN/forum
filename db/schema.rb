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

ActiveRecord::Schema.define(version: 20151130181824) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "medium_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "attachments", ["medium_id"], name: "index_attachments_on_medium_id", using: :btree
  add_index "attachments", ["post_id"], name: "index_attachments_on_post_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "media", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.string   "location",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "permissible_type", limit: 255
    t.integer  "permissible_id",   limit: 4
    t.string   "action",           limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "permissions", ["permissible_id"], name: "index_permissions_on_permissible_id", using: :btree
  add_index "permissions", ["permissible_type"], name: "index_permissions_on_permissible_type", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "content",            limit: 65535
    t.text     "content_searchable", limit: 65535
    t.integer  "topic_id",           limit: 4
    t.integer  "user_id",            limit: 4
    t.datetime "date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "posts", ["date"], name: "index_posts_on_date", using: :btree
  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "role_permissions", force: :cascade do |t|
    t.integer  "role_id",       limit: 4
    t.integer  "permission_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "role_permissions", ["permission_id"], name: "index_role_permissions_on_permission_id", using: :btree
  add_index "role_permissions", ["role_id"], name: "index_role_permissions_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "setting_groups", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "setting_group_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "setting_groups", ["name"], name: "index_setting_groups_on_name", using: :btree
  add_index "setting_groups", ["setting_group_id"], name: "index_setting_groups_on_setting_group_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "key",              limit: 255
    t.text     "value",            limit: 65535
    t.string   "type",             limit: 255
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.integer  "setting_group_id", limit: 4
    t.integer  "order",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "settings", ["key"], name: "index_settings_on_key", using: :btree
  add_index "settings", ["name"], name: "index_settings_on_name", using: :btree
  add_index "settings", ["order"], name: "index_settings_on_order", using: :btree
  add_index "settings", ["setting_group_id"], name: "index_settings_on_setting_group_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "topics", ["category_id"], name: "index_topics_on_category_id", using: :btree
  add_index "topics", ["name"], name: "index_topics_on_name", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "role_id",       limit: 4
    t.string   "scopable_type", limit: 255
    t.integer  "scopable_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["scopable_id"], name: "index_user_roles_on_scopable_id", using: :btree
  add_index "user_roles", ["scopable_type"], name: "index_user_roles_on_scopable_type", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "mail",            limit: 255
    t.string   "password",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["mail"], name: "index_users_on_mail", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree

  add_foreign_key "attachments", "media"
  add_foreign_key "attachments", "posts"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "setting_groups", "setting_groups"
  add_foreign_key "settings", "setting_groups"
  add_foreign_key "topics", "categories"
  add_foreign_key "topics", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
