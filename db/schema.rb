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

ActiveRecord::Schema.define(version: 20150605175258) do

  create_table "assuntos", force: :cascade do |t|
    t.string   "nome_assunto", limit: 255
    t.text     "descricao",    limit: 65535
    t.string   "link_image",   limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "disponivel",   limit: 4,     default: 0
    t.string   "slug",         limit: 255
  end

  add_index "assuntos", ["slug"], name: "index_assuntos_on_slug", unique: true, using: :btree
  add_index "assuntos", ["user_id"], name: "index_assuntos_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "questaos", force: :cascade do |t|
    t.text     "pergunta",   limit: 65535
    t.text     "resposta",   limit: 65535
    t.text     "dica",       limit: 65535
    t.integer  "tema_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "disponivel", limit: 4,     default: 0
  end

  add_index "questaos", ["tema_id"], name: "index_questaos_on_tema_id", using: :btree
  add_index "questaos", ["user_id"], name: "index_questaos_on_user_id", using: :btree

  create_table "questaousers", force: :cascade do |t|
    t.integer  "entendimento", limit: 4
    t.integer  "questao_id",   limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "questaousers", ["questao_id"], name: "index_questaousers_on_questao_id", using: :btree
  add_index "questaousers", ["user_id"], name: "index_questaousers_on_user_id", using: :btree

  create_table "temas", force: :cascade do |t|
    t.string   "nome_tema",  limit: 255
    t.integer  "assunto_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "disponivel", limit: 4,   default: 0
    t.string   "slug",       limit: 255
  end

  add_index "temas", ["assunto_id"], name: "index_temas_on_assunto_id", using: :btree
  add_index "temas", ["slug"], name: "index_temas_on_slug", unique: true, using: :btree
  add_index "temas", ["user_id"], name: "index_temas_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "assuntos", "users"
  add_foreign_key "questaos", "temas"
  add_foreign_key "questaos", "users"
  add_foreign_key "questaousers", "questaos"
  add_foreign_key "questaousers", "users"
  add_foreign_key "temas", "assuntos"
  add_foreign_key "temas", "users"
end
