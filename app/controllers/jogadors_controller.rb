class JogadorsController < ApplicationController
  before_action :set_jogador, only: [:show, :edit, :update, :destroy]
  before_action :get_partida, only: [:new, :edit, :create]

  # GET /jogadors
  # GET /jogadors.json
  def index
    
    if !params[:partida_id]
      @partida = get_partida
    else
      @partida = get_usuario_sessao.partidas.find(params[:partida_id])
      set_partida(@partida)

    end

     @jogadors = @partida.jogadors.all
  end

  # GET /jogadors/1
  # GET /jogadors/1.json
  def show
  end

  # GET /jogadors/new
  def new
    @jogador = @partida.jogadors.new
  end

  # GET /jogadors/1/edit
  def edit
  end

  # POST /jogadors
  # POST /jogadors.json
  def create
    @jogador = @partida.jogadors.new(jogador_params)

    respond_to do |format|
      if @jogador.save
        format.html { redirect_to "/jogadors", notice: 'Jogador was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /jogadors/1
  # PATCH/PUT /jogadors/1.json
  def update
    respond_to do |format|
      if @jogador.update(jogador_params)
        format.html { redirect_to "/jogadors", notice: 'Jogador was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /jogadors/1
  # DELETE /jogadors/1.json
  def destroy
    @jogador.destroy
    respond_to do |format|
      format.html { redirect_to jogadors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jogador
      @jogador = get_partida.jogadors.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jogador_params
      params.require(:jogador).permit(:partida_id, :nome, :habilidade, :hab_defesa, :hab_meio, :hab_ataque, :telefone, :email, :mensalista, :ativo)
    end

    def set_partida(pPartida)
        session[:partida_id] = pPartida.id 
    end
   
    def get_partida 
        @partida = get_usuario_sessao.partidas.find(session[:partida_id])
    end
end
