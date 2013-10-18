require 'test_helper'

class SourceDataPfrsControllerTest < ActionController::TestCase
  setup do
    @source_data_pfr = source_data_pfrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_data_pfrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_data_pfr" do
    assert_difference('SourceDataPfr.count') do
      post :create, source_data_pfr: { age: @source_data_pfr.age, coach: @source_data_pfr.coach, employer: @source_data_pfr.employer, level: @source_data_pfr.level, role: @source_data_pfr.role, year: @source_data_pfr.year }
    end

    assert_redirected_to source_data_pfr_path(assigns(:source_data_pfr))
  end

  test "should show source_data_pfr" do
    get :show, id: @source_data_pfr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @source_data_pfr
    assert_response :success
  end

  test "should update source_data_pfr" do
    patch :update, id: @source_data_pfr, source_data_pfr: { age: @source_data_pfr.age, coach: @source_data_pfr.coach, employer: @source_data_pfr.employer, level: @source_data_pfr.level, role: @source_data_pfr.role, year: @source_data_pfr.year }
    assert_redirected_to source_data_pfr_path(assigns(:source_data_pfr))
  end

  test "should destroy source_data_pfr" do
    assert_difference('SourceDataPfr.count', -1) do
      delete :destroy, id: @source_data_pfr
    end

    assert_redirected_to source_data_pfrs_path
  end
end
