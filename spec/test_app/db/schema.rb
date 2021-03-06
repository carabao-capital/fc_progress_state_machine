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

ActiveRecord::Schema.define(version: 20171006021345) do

  create_table "fc_progress_state_machine_edges", force: :cascade do |t|
    t.integer  "graph_id"
    t.string   "short_name_a"
    t.string   "short_name_b"
    t.float    "score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "fc_progress_state_machine_graphs", force: :cascade do |t|
    t.string   "name"
    t.integer  "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fc_progress_state_machine_states", force: :cascade do |t|
    t.integer  "graph_id"
    t.string   "name",        null: false
    t.string   "short_name",  null: false
    t.string   "description", null: false
    t.string   "condition",   null: false
    t.boolean  "is_initial"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "fc_progress_state_machine_states", ["short_name"], name: "index_fc_progress_state_machine_states_on_short_name", unique: true

  create_table "fc_progress_state_machine_trackers", force: :cascade do |t|
    t.integer  "lead_id"
    t.integer  "graph_id"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fc_progress_state_machine_transition_logs", force: :cascade do |t|
    t.integer  "tracker_id"
    t.string   "state_short_name"
    t.datetime "transitioned_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "leads", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
