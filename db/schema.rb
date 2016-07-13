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

ActiveRecord::Schema.define(version: 20160713135037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "amounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "factory_id"
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "new"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "home_page"
    t.text     "content"
    t.string   "title"
  end

  add_index "collections", ["factory_id"], name: "index_collections_on_factory_id", using: :btree

  create_table "collections_materials", force: :cascade do |t|
    t.integer "collection_id"
    t.integer "material_id"
  end

  add_index "collections_materials", ["collection_id"], name: "index_collections_materials_on_collection_id", using: :btree
  add_index "collections_materials", ["material_id"], name: "index_collections_materials_on_material_id", using: :btree

  create_table "collections_tags", id: false, force: :cascade do |t|
    t.integer "collection_id"
    t.integer "tag_id"
  end

  add_index "collections_tags", ["collection_id"], name: "index_collections_tags_on_collection_id", using: :btree
  add_index "collections_tags", ["tag_id"], name: "index_collections_tags_on_tag_id", using: :btree

  create_table "collections_types", force: :cascade do |t|
    t.integer "type_id"
    t.integer "collection_id"
  end

  add_index "collections_types", ["collection_id"], name: "index_collections_types_on_collection_id", using: :btree
  add_index "collections_types", ["type_id"], name: "index_collections_types_on_type_id", using: :btree

  create_table "collections_zones", force: :cascade do |t|
    t.integer "zone_id"
    t.integer "collection_id"
  end

  add_index "collections_zones", ["collection_id"], name: "index_collections_zones_on_collection_id", using: :btree
  add_index "collections_zones", ["zone_id"], name: "index_collections_zones_on_zone_id", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factories", force: :cascade do |t|
    t.string   "name"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "filter_sizes", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.float    "min_width"
    t.float    "max_width"
    t.float    "min_length"
    t.float    "max_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.integer  "galleryable_id"
    t.string   "galleryable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "galleries", ["galleryable_type", "galleryable_id"], name: "index_galleries_on_galleryable_type_and_galleryable_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "gallery_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "images", ["gallery_id"], name: "index_images_on_gallery_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "head"
    t.string   "short"
    t.text     "middle"
    t.text     "full"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "key",                null: false
    t.string   "name"
    t.string   "subname"
    t.text     "content"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "top_text"
    t.text     "bottom_text"
  end

  create_table "sliders", force: :cascade do |t|
    t.integer  "priority"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "surfaces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "text"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tags", ["url"], name: "index_tags_on_url", using: :btree

  create_table "tiles", force: :cascade do |t|
    t.integer  "amount_id"
    t.integer  "collection_id"
    t.integer  "surface_id"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.float    "width"
    t.string   "code"
    t.float    "length"
    t.integer  "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "single_price"
    t.integer  "compose_price"
  end

  add_index "tiles", ["amount_id"], name: "index_tiles_on_amount_id", using: :btree
  add_index "tiles", ["collection_id"], name: "index_tiles_on_collection_id", using: :btree
  add_index "tiles", ["surface_id"], name: "index_tiles_on_surface_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "images", "galleries"
end
