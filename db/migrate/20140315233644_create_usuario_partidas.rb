class CreateUsuarioPartidas < ActiveRecord::Migration
  def change
    create_table :usuario_partidas do |t|
      t.belongs_to :usuario, index: true
      t.belongs_to :partida, index: true
      t.boolean :administrador

      t.timestamps
    end
  end
end
