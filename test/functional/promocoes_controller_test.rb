require 'test_helper'

class PromocoesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promocoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promocao" do
    assert_difference('Promocao.count') do
      post :create, :promocao => { }
    end

    assert_redirected_to promocao_path(assigns(:promocao))
  end

  test "should show promocao" do
    get :show, :id => promocoes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => promocoes(:one).to_param
    assert_response :success
  end

  test "should update promocao" do
    put :update, :id => promocoes(:one).to_param, :promocao => { }
    assert_redirected_to promocao_path(assigns(:promocao))
  end

  test "should destroy promocao" do
    assert_difference('Promocao.count', -1) do
      delete :destroy, :id => promocoes(:one).to_param
    end

    assert_redirected_to promocoes_path
  end
end
