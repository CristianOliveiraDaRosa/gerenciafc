class CreatePartidaJogadas < ActiveRecord::Migration
  def change
    create_table :partida_jogadas do |t|
      t.belongs_to :partida, index: true
      t.references :equipe, index: true
      t.integer :placar_equipe_a
      t.references :equipe, index: true
      t.integer :placar_equipe_b

      t.timestamps
    end
  end
end
