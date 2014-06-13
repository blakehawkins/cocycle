require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = groups :morning
  end

  test 'should require a start time to save group' do
    @group.start_time = nil
    assert_not @group.save
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

  test 'should not convert an invalid time to seconds since midnight' do
    %w(2400 123 00:60 12:0 1am 12:30pm 7:40\ am).each do |time|
      @group.time = time
      assert_nil @group.start_time
      assert_not @group.save
    end
  end

  test 'should convert a valid time to seconds since midnight' do
    { 0.minutes             => '00:00',
      4.hours + 56.minutes  => '0456',
      12.hours + 34.minutes => '1234',
      13.hours + 37.minutes => '13:37',
      1.day - 1.minute      => '23:59'
    }.each do |expected, time|
      @group.time = time
      assert_equal expected, @group.start_time
      assert @group.save
    end
  end

  test 'should convert seconds since midnight to a time string' do
    @group.time = '1234'
    assert_equal '12:34', @group.time

    @group.start_time = 11.hours + 11.minutes + 11.seconds
    assert_equal '11:11', @group.time
  end
end
