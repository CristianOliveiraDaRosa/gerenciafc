module UsuariosHelper

   def set_usuario_sessao(pUsuario)
       session[:usuario_id] = pUsuario.id
   end

   def get_usuario_sessao
       begin
           usuario = Usuario.find(session['usuario_id'])
           if usuario
              return usuario
           else   
              redirect_to "/"
           end
           
       rescue Exception => e
           p "ERRO BUSCA USUARIO #{e}"
           nil 
       end
   end

   def del_usuario_sessao
       session[:usuario_id] = nil
   end

   def has_usuario_sessao
       get_usuario_sessao 
   end

end
