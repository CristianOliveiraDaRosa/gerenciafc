  class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to "/"
    # @usuarios = Usuario.all
  end

  def show
  end

  def new
    @usuario = Usuario.new  
    @msg_error = flash[:msg_error]
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
        flash[:email_cadastro] = @usuario.email
        redirect_to "/usuarios/login"

    else
        @usuario.clean_senha()

        flash[:msg_error] = @usuario.errors
        render action: 'new'
    end
  end

  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario alterado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  def login
      usuario   = Usuario.new(email: params[:email], senha: params[:senha])
      
      if usuario.existe
         set_usuario_sessao(usuario)
         redirect_to "/partidas/"
      else
         if not params[:senha].nil?   and 
            not params[:senha].empty? 
            @msg_erro = "Senha inválida."
         end

         @email_cadastro = params[:email]

         if flash[:email_cadastro]
            @email_cadastro = flash[:email_cadastro]
         end
         
         render "main/index"
      end
  end

  def login_after_cadastro
     render "main/index"
  end

  def logoff
      del_usuario_sessao()
      redirect_to "/"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :senha, :senha_confirmation)
    end
end
