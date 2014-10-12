class Partida < ActiveRecord::Base
  has_many :usuario_partidas
  has_many :usuarios, :through => :usuario_partidas
  has_many :jogadors, dependent: :destroy

  validates :descricao, presence: { message: "Informe uma descrição."}
  
  DIAS_SEMANA = ["Domingo", "Segunda-feira", "Terca-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sabado"]
  TIPOS       = ["Futebol Sete", "Futebol Salao", "Futebol Onze"]
  
  @equipesPartida
 
  def gera_equipes
       @equipesPartida = [Equipe.new(descricao: "A"), Equipe.new(descricao: "B")]
       
       divide_jogadores();
      
       return @equipesPartida     
  end

  def divide_jogadores
     
     begin
        maisHabilidoso  = self.jogadors.maximum(:habilidade);
        menosHabilidoso = self.jogadors.minimum(:habilidade);
        habilidade = maisHabilidoso
        
       (menosHabilidoso..maisHabilidoso).each do 
  	    jogadores = self.jogadors.where(habilidade: habilidade)
  	      
          for j in jogadores.map{|x| x.id }.shuffle
        		  jogador = jogadores.find(j)
        		 
        		 if @equipesPartida[0].size > @equipesPartida[1].size
        		    @equipesPartida[1].adiciona(jogador)
        		 else
        		    @equipesPartida[0].adiciona(jogador)
        		 end  
  	      end

  	      habilidade = habilidade - 1
        end
      rescue

      end
  end 

end
