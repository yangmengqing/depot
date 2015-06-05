require 'test_helper'

class TestFormsControllerTest < ActionController::TestCase
  setup do
    @test_form = test_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_form" do
    assert_difference('TestForm.count') do
      post :create, test_form: { description: @test_form.description, title: @test_form.title }
    end

    assert_redirected_to test_form_path(assigns(:test_form))
  end

  test "should show test_form" do
    get :show, id: @test_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_form
    assert_response :success
  end

  test "should update test_form" do
    patch :update, id: @test_form, test_form: { description: @test_form.description, title: @test_form.title }
    assert_redirected_to test_form_path(assigns(:test_form))
  end

  test "should destroy test_form" do
    assert_difference('TestForm.count', -1) do
      delete :destroy, id: @test_form
    end

    assert_redirected_to test_forms_path
  end
end
