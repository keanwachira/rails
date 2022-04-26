require "test_helper"

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get transaction_create_url
    assert_response :success
  end

  test "should get list" do
    get transaction_list_url
    assert_response :success
  end

  test "should get show" do
    get transaction_show_url
    assert_response :success
  end
end
