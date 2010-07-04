require 'test_helper'

class PagamentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pagamento" do
    assert_difference('Pagamento.count') do
      post :create, :pagamento => { }
    end

    assert_redirected_to pagamento_path(assigns(:pagamento))
  end

  test "should show pagamento" do
    get :show, :id => pagamentos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pagamentos(:one).to_param
    assert_response :success
  end

  test "should update pagamento" do
    put :update, :id => pagamentos(:one).to_param, :pagamento => { }
    assert_redirected_to pagamento_path(assigns(:pagamento))
  end

  test "should destroy pagamento" do
    assert_difference('Pagamento.count', -1) do
      delete :destroy, :id => pagamentos(:one).to_param
    end

    assert_redirected_to pagamentos_path
  end
end
