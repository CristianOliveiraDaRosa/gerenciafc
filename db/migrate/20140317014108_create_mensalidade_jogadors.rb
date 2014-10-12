class CreateMensalidadeJogadors < ActiveRecord::Migration
  def change
    create_table :mensalidade_jogadors do |t|
      t.belongs_to :jogador, index: true
      t.string :descricao
      t.integer :valor_pagar
      t.integer :valor_pago
      t.date :data_pagar
      t.date :data_pago

      t.timestamps
    end
  end
end
