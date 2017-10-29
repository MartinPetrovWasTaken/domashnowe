require 'test_helper'

class DannisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @danni = dannis(:one)
  end

  test "should get index" do
    get dannis_url
    assert_response :success
  end

  test "should get new" do
    get new_danni_url
    assert_response :success
  end

  test "should create danni" do
    assert_difference('Danni.count') do
      post dannis_url, params: { danni: { nomer: @danni.nomer, text: @danni.text } }
    end

    assert_redirected_to danni_url(Danni.last)
  end

  test "should show danni" do
    get danni_url(@danni)
    assert_response :success
  end

  test "should get edit" do
    get edit_danni_url(@danni)
    assert_response :success
  end

  test "should update danni" do
    patch danni_url(@danni), params: { danni: { nomer: @danni.nomer, text: @danni.text } }
    assert_redirected_to danni_url(@danni)
  end

  test "should destroy danni" do
    assert_difference('Danni.count', -1) do
      delete danni_url(@danni)
    end

    assert_redirected_to dannis_url
  end
end
