require 'test_helper'

class ModelTypesControllerTest < ActionController::TestCase
  setup do
    @model_type = model_types(:one)
  end

  test "should get index" do
    get :index, model_id: "jet"
    assert_response :success
  end

  test "should get new" do
    get :new, model_id: "jet"
    assert_response :success
  end

  test "should create model_type" do
    assert_difference('ModelType.count') do
      post :create, model_type: { name: "banana", model_type_code: "2345", base_price: 199 }, model_id: "jet"
    end
    assert_redirected_to model_model_type_path(:jet, assigns(:model_type))
  end

end
