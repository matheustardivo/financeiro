require 'test_helper'

class MovimentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimento" do
    assert_difference('Movimento.count') do
      post :create, :movimento => { }
    end

    assert_redirected_to movimento_path(assigns(:movimento))
  end

  test "should show movimento" do
    get :show, :id => movimentos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => movimentos(:one).to_param
    assert_response :success
  end

  test "should update movimento" do
    put :update, :id => movimentos(:one).to_param, :movimento => { }
    assert_redirected_to movimento_path(assigns(:movimento))
  end

  test "should destroy movimento" do
    assert_difference('Movimento.count', -1) do
      delete :destroy, :id => movimentos(:one).to_param
    end

    assert_redirected_to movimentos_path
  end
end
