class CreateEquipesJogadors < ActiveRecord::Migration
  def change
    create_table :equipes_jogadors do |t|
      t.belongs_to :equipe, index: true
      t.belongs_to :jogador, index: true
      t.date       :data_jogo

      t.timestamps
    end
    add_index :equipes_jogadors, [:equipe_id, :jogador_id]
  end
end
