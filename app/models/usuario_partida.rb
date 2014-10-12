class UsuarioPartida < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :partida
  
  validate :usuario, uniqueness: true 
  validate :partida, uniqueness: true 

end
