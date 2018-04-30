require 'test_helper'

class DepoimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @depoimento = depoimentos(:one)
  end

  test "should get index" do
    get depoimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_depoimento_url
    assert_response :success
  end

  test "should create depoimento" do
    assert_difference('Depoimento.count') do
      post depoimentos_url, params: { depoimento: { texto: @depoimento.texto, usuario_id: @depoimento.usuario_id } }
    end

    assert_redirected_to depoimento_url(Depoimento.last)
  end

  test "should show depoimento" do
    get depoimento_url(@depoimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_depoimento_url(@depoimento)
    assert_response :success
  end

  test "should update depoimento" do
    patch depoimento_url(@depoimento), params: { depoimento: { texto: @depoimento.texto, usuario_id: @depoimento.usuario_id } }
    assert_redirected_to depoimento_url(@depoimento)
  end

  test "should destroy depoimento" do
    assert_difference('Depoimento.count', -1) do
      delete depoimento_url(@depoimento)
    end

    assert_redirected_to depoimentos_url
  end
end
