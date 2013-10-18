require 'test_helper'

class CoachEmploymentsControllerTest < ActionController::TestCase
  setup do
    @coach_employment = coach_employments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coach_employments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coach_employment" do
    assert_difference('CoachEmployment.count') do
      post :create, coach_employment: { age: @coach_employment.age, coach_id: @coach_employment.coach_id, role: @coach_employment.role, team_id: @coach_employment.team_id, year: @coach_employment.year }
    end

    assert_redirected_to coach_employment_path(assigns(:coach_employment))
  end

  test "should show coach_employment" do
    get :show, id: @coach_employment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coach_employment
    assert_response :success
  end

  test "should update coach_employment" do
    patch :update, id: @coach_employment, coach_employment: { age: @coach_employment.age, coach_id: @coach_employment.coach_id, role: @coach_employment.role, team_id: @coach_employment.team_id, year: @coach_employment.year }
    assert_redirected_to coach_employment_path(assigns(:coach_employment))
  end

  test "should destroy coach_employment" do
    assert_difference('CoachEmployment.count', -1) do
      delete :destroy, id: @coach_employment
    end

    assert_redirected_to coach_employments_path
  end
end
