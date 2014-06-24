require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new time: '12:34'
  end

  test 'should not save a group without a time' do
    @group.time = nil
    assert_not @group.save, 'Group saved without time'
  end

  test 'should not save group with invalid time' do
    %w(12:345 :34 12: 24:00 00:60 ab:cd).each do |t|
      @group.time = t
      assert_not @group.save, "Group saved with time: #{t.inspect}"
    end
  end

  test 'should save group with valid time' do
    assert @group.update time: '01:23'
    assert_equal '01:23', @group.time
  end

  test 'should convert a 1-digit hour to a time' do
    assert @group.update time: '1'
    assert_equal '01:00', @group.time
  end

  test 'should convert a 2-digit hour to a time' do
    assert @group.update time: '12'
    assert_equal '12:00', @group.time
  end

  test 'should convert a 4-digit military time' do
    assert @group.update time: '0123'
    assert_equal '01:23', @group.time
  end
end
