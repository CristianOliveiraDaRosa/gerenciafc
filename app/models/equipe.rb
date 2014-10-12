class Equipe < ActiveRecord::Base
  has_many :equipes_jogadors
  has_many :jogadors ,:through => :equipes_jogadors
  
  @arrayJogadores  
  
  def adiciona(pJogador)
      if @arrayJogadores.nil?
         @arrayJogadores = Array.new 
      end 
         @arrayJogadores << pJogador
  end

  def get_jogadores
      if @arrayJogadores
         @arrayJogadores
      else
         []
      end
  end
  
  def size
      if @arrayJogadores.nil?
         0
      else
         @arrayJogadores.size
      end
  end 

end
