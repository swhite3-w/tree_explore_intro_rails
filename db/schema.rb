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

ActiveRecord::Schema[7.2].define(version: 2026_03_26_001654) do
  create_table "neighbourhoods", force: :cascade do |t|
    t.string "name"
    t.string "electoral_ward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "park"
    t.string "location_class"
    t.string "property_type"
    t.string "street"
    t.string "street_from"
    t.string "street_to"
    t.decimal "x_coord"
    t.decimal "y_coord"
    t.string "point"
    t.integer "neighbourhood_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighbourhood_id"], name: "index_sites_on_neighbourhood_id"
  end

  create_table "trees", force: :cascade do |t|
    t.integer "tree_id_external"
    t.string "botanical_name"
    t.string "common_name"
    t.integer "diameter_at_breast_height"
    t.string "ded_tag_number"
    t.integer "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_trees_on_site_id"
  end

  add_foreign_key "sites", "neighbourhoods"
  add_foreign_key "trees", "sites"
end
