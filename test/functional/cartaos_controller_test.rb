require 'test_helper'

class CartaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cartaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cartao" do
    assert_difference('Cartao.count') do
      post :create, :cartao => { }
    end

    assert_redirected_to cartao_path(assigns(:cartao))
  end

  test "should show cartao" do
    get :show, :id => cartaos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cartaos(:one).to_param
    assert_response :success
  end

  test "should update cartao" do
    put :update, :id => cartaos(:one).to_param, :cartao => { }
    assert_redirected_to cartao_path(assigns(:cartao))
  end

  test "should destroy cartao" do
    assert_difference('Cartao.count', -1) do
      delete :destroy, :id => cartaos(:one).to_param
    end

    assert_redirected_to cartaos_path
  end
end
