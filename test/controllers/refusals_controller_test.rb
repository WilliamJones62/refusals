require 'test_helper'

class RefusalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @refusal = refusals(:one)
  end

  test "should get index" do
    get refusals_url
    assert_response :success
  end

  test "should get new" do
    get new_refusal_url
    assert_response :success
  end

  test "should create refusal" do
    assert_difference('Refusal.count') do
      post refusals_url, params: { refusal: { invoice_numb: @refusal.invoice_numb, part_code: @refusal.part_code, qty: @refusal.qty } }
    end

    assert_redirected_to refusal_url(Refusal.last)
  end

  test "should show refusal" do
    get refusal_url(@refusal)
    assert_response :success
  end

  test "should get edit" do
    get edit_refusal_url(@refusal)
    assert_response :success
  end

  test "should update refusal" do
    patch refusal_url(@refusal), params: { refusal: { invoice_numb: @refusal.invoice_numb, part_code: @refusal.part_code, qty: @refusal.qty } }
    assert_redirected_to refusal_url(@refusal)
  end

  test "should destroy refusal" do
    assert_difference('Refusal.count', -1) do
      delete refusal_url(@refusal)
    end

    assert_redirected_to refusals_url
  end
end
