require 'test_helper'

class DrinkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drink_index_url
    assert_response :success
  end

  test "should get show" do
    get drink_show_url
    assert_response :success
  end

end
