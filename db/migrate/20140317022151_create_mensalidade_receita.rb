class CreateMensalidadeReceita < ActiveRecord::Migration
  def change
    create_table :mensalidade_receita do |t|
      t.belongs_to :mensalidade_jogador, index: true
      t.belongs_to :receita, index: true

      t.timestamps
    end
  end
end
