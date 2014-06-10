require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = groups :morning
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns :groups
  end

  test 'should create group' do
    assert_difference -> { Group.count } do
      post :create, group: { start_time: 12.hours }
    end

    assert_redirected_to group_path assigns :group
  end

  test 'should not create group with missing params' do
    assert_no_difference -> { Group.count } do
      post :create, group: { start_time: nil }
    end
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_not_nil assigns :group
  end

  test 'should get edit' do
    get :edit, id: @group
    assert_response :success
  end

  test 'should show group' do
    get :show, id: @group
    assert_response :success
  end

  test 'should update group' do
    patch :update, id: @group, group: { start_time: 13.hours + 13.minutes }
    assert_equal Group.find(@group).start_time, 13.hours + 13.minutes

    assert_redirected_to group_path assigns :group
  end

  test 'should destroy group' do
    assert_difference -> { Group.count }, -1 do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
