require "test_helper"

class QrCodeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get qr_code_new_url
    assert_response :success
  end

  test "should get generate_qr_code" do
    get qr_code_generate_qr_code_url
    assert_response :success
  end
end
