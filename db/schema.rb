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

ActiveRecord::Schema.define(version: 2020_11_13_113434) do

  create_table "objets", force: :cascade do |t|
    t.string "name"
    t.integer "stat1"
    t.integer "stat2"
    t.string "rarety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "personnage_id"
    t.index ["personnage_id"], name: "index_objets_on_personnage_id"
  end

  create_table "personnages", force: :cascade do |t|
    t.string "name"
    t.string "personnage_class"
    t.string "race"
    t.integer "niveau"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
