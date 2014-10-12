class CreateFinanceiroPartidas < ActiveRecord::Migration
  def change
    create_table :financeiro_partidas do |t|
      t.belongs_to :partida, index: true
      t.integer :valor_mensalidade
      t.integer :valor_quadra

      t.timestamps
    end
  end
end
