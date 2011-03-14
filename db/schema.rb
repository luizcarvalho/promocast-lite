# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110215203043) do

  create_table "ouvinte_promocoes", :force => true do |t|
    t.integer  "ouvinte_id"
    t.integer  "promocao_id"
    t.boolean  "premiado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ouvintes", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "telefone",   :null => false
    t.string   "endereco"
    t.date     "nascimento"
    t.string   "cpf"
    t.string   "rg"
    t.boolean  "ativo",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programas", :force => true do |t|
    t.string   "nome",       :null => false
    t.text     "descricao"
    t.text     "locutores"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promocoes", :force => true do |t|
    t.integer  "programa_id"
    t.string   "titulo",                         :null => false
    t.datetime "inicio"
    t.datetime "fim"
    t.boolean  "multiusuario", :default => true
    t.text     "premiacao"
    t.text     "descricao"
    t.boolean  "ativo",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "useres", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "useres", ["login"], :name => "index_useres_on_login", :unique => true

end
