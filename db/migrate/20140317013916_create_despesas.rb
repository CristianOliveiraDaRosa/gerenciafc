class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.belongs_to :financeiro_partida, index: true
      t.string :descricao
      t.integer :valor_pagar
      t.integer :valor_pago
      t.date :data_pagar
      t.date :data_pago

      t.timestamps
    end
  end
end
