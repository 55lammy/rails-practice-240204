require "test_helper"

class BulletinBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletin_board_index_url
    assert_response :success
  end
end
