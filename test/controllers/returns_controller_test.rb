require 'test_helper'

class ReturnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @return = returns(:one)
  end

  test "should get index" do
    get returns_url
    assert_response :success
  end

  test "should get new" do
    get new_return_url
    assert_response :success
  end

  test "should create return" do
    assert_difference('Return.count') do
      post returns_url, params: { return: { order_numb: @return.order_numb, user_id: @return.user_id } }
    end

    assert_redirected_to return_url(Return.last)
  end

  test "should show return" do
    get return_url(@return)
    assert_response :success
  end

  test "should get edit" do
    get edit_return_url(@return)
    assert_response :success
  end

  test "should update return" do
    patch return_url(@return), params: { return: { order_numb: @return.order_numb, user_id: @return.user_id } }
    assert_redirected_to return_url(@return)
  end

  test "should destroy return" do
    assert_difference('Return.count', -1) do
      delete return_url(@return)
    end

    assert_redirected_to returns_url
  end
end
