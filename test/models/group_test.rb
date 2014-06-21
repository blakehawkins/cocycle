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
end
