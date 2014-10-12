require 'date'
class PartidasController < ApplicationController
  before_action :set_partida, only: [:show, :edit, :update, :destroy]

  # GET /partidas
  # GET /partidas.json
  def index
    usuario   = get_usuario_sessao

    if usuario
        @partidas = usuario.partidas.all
        render :layout => "admin"
    else
        redirect_to "/"
    end 
  end

  # GET /partidas/1
  # GET /partidas/1.json
  def show
  end

  # GET /partidas/new
  def new
    @partida = get_usuario_sessao.partidas.new
  end

  # GET /partidas/1/edit
  def edit
  end

  # POST /partidas
  # POST /partidas.json
  def create
    @partida = get_usuario_sessao.partidas.new(partida_params)
    respond_to do |format|
      if @partida.save
        get_usuario_sessao.usuario_partidas.create(partida: @partida)
        get_usuario_sessao.save
    
        format.html { redirect_to "/partidas/", notice: 'Partida was successfully created.' }
      
      else
        format.html { render action: 'new' }
      
      end
    end
  end

  # PATCH/PUT /partidas/1
  # PATCH/PUT /partidas/1.json
  def update
    respond_to do |format|
      if @partida.update(partida_params)
         format.html { redirect_to "/partidas/", notice: 'Partida was successfully created.' }
      else
         format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /partidas/1
  # DELETE /partidas/1.json
  def destroy
    @partida.destroy
    respond_to do |format|
      format.html { redirect_to partidas_url }
      format.json { head :no_content }
    end
  end

  def gera_equipes
  
        @partida = get_usuario_sessao.partidas.find(params[:partida_id])
        @equipes = @partida.gera_equipes
        cookies[:equipe_a] = ActiveSupport::JSON.encode(@equipes[0].get_jogadores.map{|x| x.id })
        cookies[:equipe_b] = ActiveSupport::JSON.encode(@equipes[1].get_jogadores.map{|x| x.id })
  
  end


  def salva_equipes
      hoje = Date.now
      equipe_a  = Equipe.new(descricao: "A", data: hoje)
      equipe_a.equipes_jogadors.new(data_jogo: hoje) 
      equipe_b  = Equipe.new(descricao: "B", data: hoje)
      equipe_b.equipes_jogadors.new(data_jogo: hoje)
      
      equipe_a = ActiveSupport::JSON.decode(cookies[:equipe_a])
      equipe_b = ActiveSupport::JSON.decode(cookies[:equipe_b])

      equipe_a.each do |jog_id|
         equipe_a.jogadors << Jogador.find(jog_id)
      end

      equipe_b.each do |jog_id|
         equipe_b.jogadors << Jogador.find(jog_id)
      end
      
       equipe_a.save
       equipe_b.save
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partida
      begin
         @partida = get_usuario_sessao.partidas.find(params[:id])
      rescue Exception => e
          p "ERRO METHOD set_partida #{e}"
          redirect_to "/"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partida_params
      params.require(:partida).permit(:usuario_id, :descricao, :tipo, :dia_semana)
    end

end
