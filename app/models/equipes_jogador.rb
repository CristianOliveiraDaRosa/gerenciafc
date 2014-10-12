class EquipesJogador < ActiveRecord::Base
  belongs_to :equipe
  belongs_to :jogador
end
