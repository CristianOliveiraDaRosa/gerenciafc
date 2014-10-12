require 'test_helper'

class JogadorsControllerTest < ActionController::TestCase
  setup do
    @jogador = jogadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jogadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jogador" do
    assert_difference('Jogador.count') do
      post :create, jogador: { ativo: @jogador.ativo, email: @jogador.email, hab_ataque: @jogador.hab_ataque, hab_defesa: @jogador.hab_defesa, hab_meio: @jogador.hab_meio, habilidade: @jogador.habilidade, mensalista: @jogador.mensalista, nome: @jogador.nome, partida_id: @jogador.partida_id, telefone: @jogador.telefone }
    end

    assert_redirected_to jogador_path(assigns(:jogador))
  end

  test "should show jogador" do
    get :show, id: @jogador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jogador
    assert_response :success
  end

  test "should update jogador" do
    patch :update, id: @jogador, jogador: { ativo: @jogador.ativo, email: @jogador.email, hab_ataque: @jogador.hab_ataque, hab_defesa: @jogador.hab_defesa, hab_meio: @jogador.hab_meio, habilidade: @jogador.habilidade, mensalista: @jogador.mensalista, nome: @jogador.nome, partida_id: @jogador.partida_id, telefone: @jogador.telefone }
    assert_redirected_to jogador_path(assigns(:jogador))
  end

  test "should destroy jogador" do
    assert_difference('Jogador.count', -1) do
      delete :destroy, id: @jogador
    end

    assert_redirected_to jogadors_path
  end
end
