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
      post :create, group: { time: '12:30' }
    end

    assert_redirected_to group_path assigns :group
  end

  test 'should not create group with missing params' do
    assert_no_difference -> { Group.count } do
      post :create, group: { time: nil }
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
    patch :update, id: @group, group: { time: '13:13' }

    group = Group.find @group
    assert_equal '13:13', group.time
    assert_equal [13, 13], [group.hour, group.minute]

    assert_redirected_to group_path assigns :group
  end

  test 'should destroy group' do
    assert_difference -> { Group.count }, -1 do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
