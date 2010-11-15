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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101114134950) do

  create_table "agendas", :force => true do |t|
    t.integer  "user_id"
    t.string   "nome"
    t.date     "mes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cartaos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "contas", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "despesas", :force => true do |t|
    t.integer  "fatura_id"
    t.date     "data"
    t.integer  "tipo_id"
    t.integer  "parcelas"
    t.text     "descricao"
    t.decimal  "valor"
    t.integer  "despesa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faturas", :force => true do |t|
    t.integer  "cartao_id"
    t.date     "mes"
    t.string   "situacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimentos", :force => true do |t|
    t.integer  "conta_id"
    t.integer  "tipo_id"
    t.date     "dia"
    t.text     "descricao"
    t.decimal  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagamentos", :force => true do |t|
    t.text     "nome"
    t.text     "descricao"
    t.date     "vencimento"
    t.decimal  "valor"
    t.boolean  "confirmado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "agenda_id"
  end

  create_table "tipos", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "valor"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
