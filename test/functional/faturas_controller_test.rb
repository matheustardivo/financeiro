require 'test_helper'

class FaturasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faturas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fatura" do
    assert_difference('Fatura.count') do
      post :create, :fatura => { }
    end

    assert_redirected_to fatura_path(assigns(:fatura))
  end

  test "should show fatura" do
    get :show, :id => faturas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => faturas(:one).to_param
    assert_response :success
  end

  test "should update fatura" do
    put :update, :id => faturas(:one).to_param, :fatura => { }
    assert_redirected_to fatura_path(assigns(:fatura))
  end

  test "should destroy fatura" do
    assert_difference('Fatura.count', -1) do
      delete :destroy, :id => faturas(:one).to_param
    end

    assert_redirected_to faturas_path
  end
end
