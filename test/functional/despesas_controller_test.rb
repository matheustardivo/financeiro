require 'test_helper'

class DespesasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:despesas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create despesa" do
    assert_difference('Despesa.count') do
      post :create, :despesa => { }
    end

    assert_redirected_to despesa_path(assigns(:despesa))
  end

  test "should show despesa" do
    get :show, :id => despesas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => despesas(:one).to_param
    assert_response :success
  end

  test "should update despesa" do
    put :update, :id => despesas(:one).to_param, :despesa => { }
    assert_redirected_to despesa_path(assigns(:despesa))
  end

  test "should destroy despesa" do
    assert_difference('Despesa.count', -1) do
      delete :destroy, :id => despesas(:one).to_param
    end

    assert_redirected_to despesas_path
  end
end
