require 'test_helper'

class AgendasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agenda" do
    assert_difference('Agenda.count') do
      post :create, :agenda => { }
    end

    assert_redirected_to agenda_path(assigns(:agenda))
  end

  test "should show agenda" do
    get :show, :id => agendas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => agendas(:one).to_param
    assert_response :success
  end

  test "should update agenda" do
    put :update, :id => agendas(:one).to_param, :agenda => { }
    assert_redirected_to agenda_path(assigns(:agenda))
  end

  test "should destroy agenda" do
    assert_difference('Agenda.count', -1) do
      delete :destroy, :id => agendas(:one).to_param
    end

    assert_redirected_to agendas_path
  end
end
