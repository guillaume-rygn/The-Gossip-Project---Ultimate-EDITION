require 'test_helper'

class Exemple32ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exemple32_index_url
    assert_response :success
  end

  test "should get destroy" do
    get exemple32_destroy_url
    assert_response :success
  end

  test "should get create" do
    get exemple32_create_url
    assert_response :success
  end

end
