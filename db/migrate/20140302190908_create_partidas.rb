class CreatePartidas < ActiveRecord::Migration
  def change
    create_table :partidas do |t|
      t.string :descricao
      t.integer :tipo
      t.integer :dia_semana

      t.timestamps
    end
  end
end
