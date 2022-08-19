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
      post :create, params: { group: { time: '12:30' } }
    end

    assert_redirected_to group_path assigns :group
  end

  test 'should not create group with missing params' do
    assert_no_difference -> { Group.count } do
      post :create, params: { group: { time: nil } }
    end
  end

  test 'should not create group with unparsable time' do
    assert_no_difference -> { Group.count } do
      post :create, params: { group: { time: "one o'clock" } }
    end
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert_not_nil assigns :group
  end

  test 'should get edit' do
    get :edit, params: { id: @group }
    assert_response :success
  end

  test 'should show group' do
    get :show, params: { id: @group }
    assert_response :success
  end

  test 'should update group' do
    patch :update, params: { id: @group, group: { time: '13:13' } }

    group = Group.find @group.id
    assert_equal '13:13', group.time

    assert_redirected_to group_path assigns :group
  end

  test 'should destroy group' do
    assert_difference -> { Group.count }, -1 do
      delete :destroy, params: { id: @group }
    end

    assert_redirected_to groups_path
  end
end
