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

ActiveRecord::Schema.define(version: 20170324143355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.string   "name"
    t.date     "publication_date"
    t.text     "description"
    t.integer  "investigation_group_id"
    t.integer  "state"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["investigation_group_id"], name: "index_contributions_on_investigation_group_id", using: :btree
  end

  create_table "event_students", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_students_on_event_id", using: :btree
    t.index ["student_id"], name: "index_event_students_on_student_id", using: :btree
  end

  create_table "event_teachers", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_teachers_on_event_id", using: :btree
    t.index ["teacher_id"], name: "index_event_teachers_on_teacher_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.integer  "investigation_group_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["investigation_group_id"], name: "index_events_on_investigation_group_id", using: :btree
  end

  create_table "history_groups", force: :cascade do |t|
    t.date     "bonding_date"
    t.date     "exit_date"
    t.integer  "investigation_group_id"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "state"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["investigation_group_id"], name: "index_history_groups_on_investigation_group_id", using: :btree
    t.index ["student_id"], name: "index_history_groups_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_history_groups_on_teacher_id", using: :btree
  end

  create_table "investigation_groups", force: :cascade do |t|
    t.string   "name"
    t.date     "createDate"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "entity"
    t.text     "URL"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_profiles_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_profiles_on_teacher_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "provider",               default: "institutional_user", null: false
    t.string   "uid",                    default: "",                   null: false
    t.string   "encrypted_password",     default: "",                   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "lastname"
    t.string   "institutional_user"
    t.integer  "investigation_group_id"
    t.json     "tokens"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true, using: :btree
    t.index ["institutional_user"], name: "index_students_on_institutional_user", unique: true, using: :btree
    t.index ["investigation_group_id"], name: "index_students_on_investigation_group_id", using: :btree
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_students_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "tag_contributions", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "contribution_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contribution_id"], name: "index_tag_contributions_on_contribution_id", using: :btree
    t.index ["tag_id"], name: "index_tag_contributions_on_tag_id", using: :btree
  end

  create_table "tag_investigation_groups", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "investigation_group_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["investigation_group_id"], name: "index_tag_investigation_groups_on_investigation_group_id", using: :btree
    t.index ["tag_id"], name: "index_tag_investigation_groups_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teacher_investigation_groups", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "investigation_group_id"
    t.integer  "rol"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["investigation_group_id"], name: "index_teacher_investigation_groups_on_investigation_group_id", using: :btree
    t.index ["teacher_id"], name: "index_teacher_investigation_groups_on_teacher_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "provider",                       default: "institutional_user", null: false
    t.string   "uid",                            default: "",                   null: false
    t.string   "encrypted_password",             default: "",                   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                  default: 0,                    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_institutional_user"
    t.string   "name"
    t.string   "lastname"
    t.string   "institutional_user"
    t.json     "tokens"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.index ["confirmation_token"], name: "index_teachers_on_confirmation_token", unique: true, using: :btree
    t.index ["institutional_user"], name: "index_teachers_on_institutional_user", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_teachers_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "ubications", force: :cascade do |t|
    t.text     "link"
    t.integer  "contribution_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contribution_id"], name: "index_ubications_on_contribution_id", using: :btree
  end

  create_table "user_contributions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "contribution_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contribution_id"], name: "index_user_contributions_on_contribution_id", using: :btree
    t.index ["student_id"], name: "index_user_contributions_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_user_contributions_on_teacher_id", using: :btree
  end

  add_foreign_key "contributions", "investigation_groups"
  add_foreign_key "event_students", "events"
  add_foreign_key "event_students", "students"
  add_foreign_key "event_teachers", "events"
  add_foreign_key "event_teachers", "teachers"
  add_foreign_key "events", "investigation_groups"
  add_foreign_key "history_groups", "investigation_groups"
  add_foreign_key "history_groups", "students"
  add_foreign_key "history_groups", "teachers"
  add_foreign_key "profiles", "students"
  add_foreign_key "profiles", "teachers"
  add_foreign_key "students", "investigation_groups"
  add_foreign_key "tag_contributions", "contributions"
  add_foreign_key "tag_contributions", "tags"
  add_foreign_key "tag_investigation_groups", "investigation_groups"
  add_foreign_key "tag_investigation_groups", "tags"
  add_foreign_key "teacher_investigation_groups", "investigation_groups"
  add_foreign_key "teacher_investigation_groups", "teachers"
  add_foreign_key "ubications", "contributions"
  add_foreign_key "user_contributions", "contributions"
  add_foreign_key "user_contributions", "students"
  add_foreign_key "user_contributions", "teachers"
end
