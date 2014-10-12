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

ActiveRecord::Schema.define(version: 20140317022151) do

  create_table "despesas", force: true do |t|
    t.integer  "financeiro_partida_id"
    t.string   "descricao"
    t.integer  "valor_pagar"
    t.integer  "valor_pago"
    t.date     "data_pagar"
    t.date     "data_pago"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "despesas", ["financeiro_partida_id"], name: "index_despesas_on_financeiro_partida_id"

  create_table "equipes", force: true do |t|
    t.string   "descricao"
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipes_jogadors", force: true do |t|
    t.integer  "equipe_id"
    t.integer  "jogador_id"
    t.date     "data_jogo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipes_jogadors", ["equipe_id", "jogador_id"], name: "index_equipes_jogadors_on_equipe_id_and_jogador_id"
  add_index "equipes_jogadors", ["equipe_id"], name: "index_equipes_jogadors_on_equipe_id"
  add_index "equipes_jogadors", ["jogador_id"], name: "index_equipes_jogadors_on_jogador_id"

  create_table "financeiro_partidas", force: true do |t|
    t.integer  "partida_id"
    t.integer  "valor_mensalidade"
    t.integer  "valor_quadra"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "financeiro_partidas", ["partida_id"], name: "index_financeiro_partidas_on_partida_id"

  create_table "jogadors", force: true do |t|
    t.integer  "partida_id"
    t.string   "nome"
    t.integer  "habilidade"
    t.integer  "hab_defesa"
    t.integer  "hab_meio"
    t.integer  "hab_ataque"
    t.string   "telefone"
    t.string   "email"
    t.boolean  "mensalista"
    t.boolean  "ativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jogadors", ["partida_id"], name: "index_jogadors_on_partida_id"

  create_table "mensalidade_jogadors", force: true do |t|
    t.integer  "jogador_id"
    t.string   "descricao"
    t.integer  "valor_pagar"
    t.integer  "valor_pago"
    t.date     "data_pagar"
    t.date     "data_pago"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mensalidade_jogadors", ["jogador_id"], name: "index_mensalidade_jogadors_on_jogador_id"

  create_table "mensalidade_receita", force: true do |t|
    t.integer  "mensalidade_jogador_id"
    t.integer  "receita_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mensalidade_receita", ["mensalidade_jogador_id"], name: "index_mensalidade_receita_on_mensalidade_jogador_id"
  add_index "mensalidade_receita", ["receita_id"], name: "index_mensalidade_receita_on_receita_id"

  create_table "partida_jogadas", force: true do |t|
    t.integer  "partida_id"
    t.integer  "equipe_id"
    t.integer  "placar_equipe_a"
    t.integer  "placar_equipe_b"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "partida_jogadas", ["equipe_id"], name: "index_partida_jogadas_on_equipe_id"
  add_index "partida_jogadas", ["partida_id"], name: "index_partida_jogadas_on_partida_id"

  create_table "partidas", force: true do |t|
    t.string   "descricao"
    t.integer  "tipo"
    t.integer  "dia_semana"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receita", force: true do |t|
    t.integer  "financeiro_partida_id"
    t.string   "descricao"
    t.integer  "valor_pagar"
    t.integer  "valor_pago"
    t.date     "data_pagar"
    t.date     "data_pago"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receita", ["financeiro_partida_id"], name: "index_receita_on_financeiro_partida_id"

  create_table "usuario_partidas", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "partida_id"
    t.boolean  "administrador"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuario_partidas", ["partida_id"], name: "index_usuario_partidas_on_partida_id"
  add_index "usuario_partidas", ["usuario_id"], name: "index_usuario_partidas_on_usuario_id"

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
