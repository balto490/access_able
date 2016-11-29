require 'test_helper'

class GeocodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @geocode = geocodes(:one)
  end

  test "should get index" do
    get geocodes_url
    assert_response :success
  end

  test "should get new" do
    get new_geocode_url
    assert_response :success
  end

  test "should create geocode" do
    assert_difference('Geocode.count') do
      post geocodes_url, params: { geocode: { address: @geocode.address, latitude: @geocode.latitude, longitude: @geocode.longitude } }
    end

    assert_redirected_to geocode_url(Geocode.last)
  end

  test "should show geocode" do
    get geocode_url(@geocode)
    assert_response :success
  end

  test "should get edit" do
    get edit_geocode_url(@geocode)
    assert_response :success
  end

  test "should update geocode" do
    patch geocode_url(@geocode), params: { geocode: { address: @geocode.address, latitude: @geocode.latitude, longitude: @geocode.longitude } }
    assert_redirected_to geocode_url(@geocode)
  end

  test "should destroy geocode" do
    assert_difference('Geocode.count', -1) do
      delete geocode_url(@geocode)
    end

    assert_redirected_to geocodes_url
  end
end
