class Jogador < ActiveRecord::Base
  belongs_to :partida
  
  has_many :equipes_jogadors
  has_many :equipes, :through => :equipes_jogadors

  validates :nome, presence: true
  validates :habilidade, presence:true

  HABILIDADES = ["Perna de pau", "Mais ou menos", "Bom jogador", "Acima da Média", "Joga muito"]

  def desc_mensalista
  	  if self.mensalista
  	  	 "Sim"
  	  else
  	  	 "Nao"
  	  end
  end

  def desc_ativo
      if self.ativo
         "Sim"
      else
         "Nao"
      end
  end

end
