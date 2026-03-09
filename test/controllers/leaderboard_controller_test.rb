require "test_helper"

class LeaderboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "h1", "Leaderboard"
  end

  test "should display players in leaderboard" do
    get root_path
    assert_select "table tbody tr", count: Player.count
  end
end
