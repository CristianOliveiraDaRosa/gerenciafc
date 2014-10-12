class PartidaJogada < ActiveRecord::Base
  belongs_to :partida
  belongs_to :equipe
  belongs_to :equipe
end
