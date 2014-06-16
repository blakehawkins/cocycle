# coding: utf-8
require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = locations(:'pointhouse rd')
  end

  test 'should not save a location without a postcode' do
    @location.postcode = nil
    assert_not @location.save, 'Location saved without a postcode'
  end

  test 'should not save a location without a latitude' do
    @location.lat = nil
    assert_not @location.save, 'Location saved without a latitude'
  end

  test 'should not save a location without a longitude' do
    @location.long = nil
    assert_not @location.save, 'Location saved without a longitude'
  end

  test 'should not save a location with a blank postcode' do
    @location.postcode = ' '
    assert_not @location.save, 'Location saved with a blank postcode'
  end

  test 'should not save a location with an invalid postcode' do
    @location.postcode = 'G11 111'
    assert_not @location.save, 'Location saved with an invalid postcode'
  end

  test 'should standardize valid postcode when location is saved' do
    @location.postcode = '   G12 3aa  '
    assert @location.save, 'Location did not save with a valid postcode'
    assert_equal 'G12 3AA', @location.postcode
  end

  test 'should not save a location with an out-of-range latitude' do
    @location.lat = '-90.000001'
    assert_not @location.save, 'Location saved with an invalid latitude'
  end

  test 'should not save a location with an out-of-range longitude' do
    @location.long = '180.000001'
    assert_not @location.save, 'Location saved with an invalid longitude'
  end

  test 'should not save a location with a non-numerical latitude' do
    @location.lat = '66° 33′ 39″ N'
    assert_not @location.save, 'Location saved with an invalid latitude'
  end

  test 'should not save a location with a non-numerical longitude' do
    @location.long = '23° 27′ 30″ E'
    assert_not @location.save, 'Location saved with an invalid longitude'
  end

  test 'should not save a duplicate location' do
    assert_not @location.dup.save, 'Duplicate location saved'
  end

  test 'should not save a location with a duplicate postcode' do
    duplicate = @location.dup
    assert_not duplicate.save, 'Location with duplicate postcode saved'

    duplicate.postcode = 'A1 1AA'
    assert duplicate.save, 'Location with unique postcode not saved'
  end

  test 'should save a location with float or string lat and long' do
    @location.lat = '90'
    @location.long = -123.4567890
    assert @location.save, 'Location did not save with valid attributes'
    assert_equal 90, @location.lat
    assert_equal BigDecimal('-123.456789'), @location.long
  end
end
