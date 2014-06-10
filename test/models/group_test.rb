require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test 'should require a start time to save group' do
    group = Group.new
    assert_not group.save
  end

  test 'should require a start time in seconds since midnight' do
    t = Time.utc 2014, 06, 10, 07, 45, 30

    group = Group.new start_time: t
    assert_not group.save

    group.start_time = t.sec.seconds + t.min.minutes + t.hour.hours
    assert group.save
  end

  test 'should not create a group with an unreasonable start_time' do
    group = Group.new start_time: 24.hours
    assert_not group.save
  end

  test 'should round start_time to second precision' do
    group = Group.create start_time: 12.hours + Math::PI.seconds
    assert_equal group.start_time, 12.hours + 3.seconds
  end
end
