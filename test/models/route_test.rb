require 'test_helper'

class RouteTest < ActiveSupport::TestCase
  def setup
    @route = routes :one
  end
  test 'should be valid with start and end coordinates' do
    assert @route.valid?
  end

  test 'should require start and finish coords to save route' do
    assert_not @route.dup.tap { |r| r.start_lat = nil }.save
    assert_not @route.dup.tap { |r| r.finish_long = nil }.save
  end

  test 'should not save a route with unreasonable coordinates' do
    assert @route.dup.tap { |r| r.start_long = 180 }.save,
           'Coordinate with -180 <= longitude <= 180 was not allowed'
    assert_not @route.dup.tap { |r| r.start_long = 181 }.save,
               'Coordinate with longitude > 180 was allowed'

    assert @route.dup.tap { |r| r.finish_long = -90 }.save,
           'Coordinate with -90 <= latitude <= 90 was not allowed'
    assert_not @route.dup.tap { |r| r.finish_lat = -91 }.save,
               'Coordinate with latitude < -90 was allowed'
  end
end
