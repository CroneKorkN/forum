require 'test_helper'

class SettingGroupsControllerTest < ActionController::TestCase
  setup do
    @setting_group = setting_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:setting_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting_group" do
    assert_difference('SettingGroup.count') do
      post :create, setting_group: { name: @setting_group.name, setting_group_id: @setting_group.setting_group_id }
    end

    assert_redirected_to setting_group_path(assigns(:setting_group))
  end

  test "should show setting_group" do
    get :show, id: @setting_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting_group
    assert_response :success
  end

  test "should update setting_group" do
    patch :update, id: @setting_group, setting_group: { name: @setting_group.name, setting_group_id: @setting_group.setting_group_id }
    assert_redirected_to setting_group_path(assigns(:setting_group))
  end

  test "should destroy setting_group" do
    assert_difference('SettingGroup.count', -1) do
      delete :destroy, id: @setting_group
    end

    assert_redirected_to setting_groups_path
  end
end
