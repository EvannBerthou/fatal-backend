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

ActiveRecord::Schema[7.0].define(version: 2023_09_02_120648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "qcm_id"
    t.string "texte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qcm_id"], name: "index_categories_on_qcm_id"
  end

  create_table "categories_questions", id: false, force: :cascade do |t|
    t.bigint "categorie_id"
    t.bigint "question_id"
    t.index ["categorie_id"], name: "index_categories_questions_on_categorie_id"
    t.index ["question_id"], name: "index_categories_questions_on_question_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id"
    t.integer "typedoption", default: 0, null: false
    t.string "valeur"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "qcms", force: :cascade do |t|
    t.string "entete"
    t.string "titre"
    t.boolean "is_randomized"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_qcms_on_user_id"
  end

  create_table "qcms_questions", id: false, force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "qcm_id"
    t.index ["qcm_id"], name: "index_qcms_questions_on_qcm_id"
    t.index ["question_id"], name: "index_qcms_questions_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "texte"
    t.boolean "right"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "typedequestion", default: 0
  end

  create_table "reponses", force: :cascade do |t|
    t.bigint "question_id"
    t.string "texte"
    t.boolean "isRight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0, null: false
    t.index ["question_id"], name: "index_reponses_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "nom"
    t.string "prenom"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.text "tokens"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "allow_password_change", default: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "categories", "qcms"
  add_foreign_key "options", "questions"
  add_foreign_key "qcms", "users"
  add_foreign_key "qcms_questions", "qcms"
  add_foreign_key "qcms_questions", "questions"
  add_foreign_key "reponses", "questions"
end
