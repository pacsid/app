require 'test_helper'

class AcessosControllerTest < ActionController::TestCase
  setup do
    @acesso = acessos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acessos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acesso" do
    assert_difference('Acesso.count') do
      post :create, acesso: { data: @acesso.data, email_id: @acesso.email_id, server_id: @acesso.server_id }
    end

    assert_redirected_to acesso_path(assigns(:acesso))
  end

  test "should show acesso" do
    get :show, id: @acesso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acesso
    assert_response :success
  end

  test "should update acesso" do
    patch :update, id: @acesso, acesso: { data: @acesso.data, email_id: @acesso.email_id, server_id: @acesso.server_id }
    assert_redirected_to acesso_path(assigns(:acesso))
  end

  test "should destroy acesso" do
    assert_difference('Acesso.count', -1) do
      delete :destroy, id: @acesso
    end

    assert_redirected_to acessos_path
  end
end
