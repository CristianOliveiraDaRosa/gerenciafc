class MensalidadeReceita < ActiveRecord::Base
  belongs_to :mensalidade_jogador
  belongs_to :receita
end
