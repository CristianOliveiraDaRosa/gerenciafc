class CreateJogadors < ActiveRecord::Migration
  def change
    create_table :jogadors do |t|
      t.belongs_to :partida, index: true
      t.string :nome
      t.integer :habilidade
      t.integer :hab_defesa
      t.integer :hab_meio
      t.integer :hab_ataque
      t.string :telefone
      t.string :email
      t.boolean :mensalista
      t.boolean :ativo

      t.timestamps
    end
  end
end
