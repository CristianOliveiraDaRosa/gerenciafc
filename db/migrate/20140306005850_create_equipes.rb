class CreateEquipes < ActiveRecord::Migration
  def change
    create_table :equipes do |t|
      t.string :descricao
      t.date   :data

      t.timestamps
    end
  end
end
