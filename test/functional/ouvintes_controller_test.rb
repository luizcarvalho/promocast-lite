require 'test_helper'

class OuvintesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ouvintes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ouvinte" do
    assert_difference('Ouvinte.count') do
      post :create, :ouvinte => { }
    end

    assert_redirected_to ouvinte_path(assigns(:ouvinte))
  end

  test "should show ouvinte" do
    get :show, :id => ouvintes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ouvintes(:one).to_param
    assert_response :success
  end

  test "should update ouvinte" do
    put :update, :id => ouvintes(:one).to_param, :ouvinte => { }
    assert_redirected_to ouvinte_path(assigns(:ouvinte))
  end

  test "should destroy ouvinte" do
    assert_difference('Ouvinte.count', -1) do
      delete :destroy, :id => ouvintes(:one).to_param
    end

    assert_redirected_to ouvintes_path
  end
end
