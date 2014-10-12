class MainController < ApplicationController
  def index
  	
  	if get_usuario_sessao
  		redirect_to "/partidas"
  	end

  end
end
