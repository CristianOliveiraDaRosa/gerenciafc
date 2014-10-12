require 'digest/sha1'

class Usuario < ActiveRecord::Base
  
  after_create :cria_partida_demo

  has_many :usuario_partidas
  has_many :partidas, :through => :usuario_partidas
  
  has_one  :detalhes_usuario  
  
  validates :nome , 
            presence: { message: "Nome deve ser informado." }
  validates :email, 
            presence: true, 
            uniqueness: { message: "Email já possui cadastro." }
  validates :senha, 
            presence: { message: "Senha deve ser informada."}, 
            confirmation: { message: "Confirmação de senha não confere."} 
  validates :senha_confirmation,
            presence: { message: "Campo confirmação deve ser informado." }

  #begin private
  attr_accessor :_senha_confirmation

  def senha=(value)
    begin
        if value.empty?
           return
        end
       write_attribute(:senha, self.class.sha1(value))
    rescue
      return
    end

  end

  def senha_confirmation=(value)
    begin
        if value.empty?
           return
        end
       self._senha_confirmation = self.class.sha1(value)
    rescue
      return
    end
  end

  def senha_confirmation
    self._senha_confirmation
  end
  #end private

  #begin static
  def self.sha1(senha)  
    Digest::SHA1.hexdigest("futbol--#{senha}--")  
  end
  #end static

  #begin callbacks
  def cria_partida_demo
     
      partida = self.partidas.new(descricao:"Partida Demo", tipo: 0, dia_semana: 0)
      partida.save

      14.times do |i|
           partida.jogadors.create(
             nome:       "Jogador #{i}",
             habilidade: rand(1..5),
           )
      end

  end
  #end callbacks

  def clean_senha
      self.senha              = nil
      self.senha_confirmation = nil
  end

  def existe
      usuario = Usuario.where(email: self.email, senha: self.senha).first
      
			if usuario 
      	self.id = usuario.id;
      end

      return usuario
  end 
  
end
