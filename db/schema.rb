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

ActiveRecord::Schema.define(version: 2019_11_12_030038) do

  create_table "books", force: :cascade do |t|
    t.string "titulo", null: false
    t.string "autor", null: false
    t.string "descricao", null: false
    t.string "edicao", null: false
    t.string "editora", null: false
    t.integer "quantidade", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "reader_id", null: false
    t.integer "book_id", null: false
    t.date "data_emprestimo", null: false
    t.date "data_devolucao", null: false
    t.boolean "devolvido", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["reader_id"], name: "index_loans_on_reader_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "nome", null: false
    t.string "cpf", null: false
    t.string "endereco", null: false
    t.string "cidade", null: false
    t.string "uf", null: false
    t.string "email", null: false
    t.string "telefone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
