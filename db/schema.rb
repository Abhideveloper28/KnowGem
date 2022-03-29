# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_29_091759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gem_files", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gem_files_gem_infos", id: false, force: :cascade do |t|
    t.bigint "gem_file_id"
    t.bigint "gem_info_id"
    t.index ["gem_file_id"], name: "index_gem_files_gem_infos_on_gem_file_id"
    t.index ["gem_info_id"], name: "index_gem_files_gem_infos_on_gem_info_id"
  end

  create_table "gem_infos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
