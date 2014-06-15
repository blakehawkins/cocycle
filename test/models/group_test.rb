require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new hour: 12, minute: 34
  end

  test 'should not save a group without an hour or minute' do
    assert_not Group.new.save, 'Group saved without hour or minute'
    assert_not Group.new(hour: 12).save, 'Group saved without hour'
    assert_not Group.new(minute: 34).save, 'Group saved without minute'
  end

  test 'should not save group with invalid hour' do
    [-1, 12.3, 24].each do |h|
      @group.hour = h
      assert_not @group.save, "Group saved with hour: #{h.inspect}"
    end
  end

  test 'should not save group with invalid minute' do
    [-1, 12.3, 60].each do |m|
      @group.minute = m
      assert_not @group.save, "Group saved with minute: #{m.inspect}"
    end
  end

  test 'should not save group with invalid time string' do
    %w(12:345 :34 12: 24:00).each do |t|
      @group.time = t
      assert_not @group.save, "Group saved with time: #{t.inspect}"
    end
  end

  test 'should convert hour and minute to a readable time' do
    assert @group.update hour: 12, minute: 34
    assert_equal '12:34', @group.time

    assert @group.update hour: 1, minute: 0
    assert_equal '01:00', @group.time
  end

  test 'should save group with valid time string' do
    assert @group.update time: '01:23'
    assert_equal '01:23', @group.time
    assert_equal [1, 23], [@group.hour, @group.minute]
  end

  test 'should override time string with hour and minute fields' do
    assert @group.update time: '01:23', minute: 32
    assert_equal '01:32', @group.time
    assert_equal [1, 32], [@group.hour, @group.minute]
  end
end
