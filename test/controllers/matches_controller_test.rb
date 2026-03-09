require "test_helper"

class MatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matches_path
    assert_response :success
    assert_select "h1", "Match History"
  end

  test "should get new" do
    get new_match_path
    assert_response :success
    assert_select "h1", "Record Match Result"
  end

  test "should create match" do
    assert_difference "Match.count", 1 do
      post matches_path, params: {
        match: {
          winner_id: players(:alice).id,
          loser_id: players(:bob).id,
          played_at: Time.current
        }
      }
    end
    assert_redirected_to matches_path
  end

  test "should not create match with same winner and loser" do
    assert_no_difference "Match.count" do
      post matches_path, params: {
        match: {
          winner_id: players(:alice).id,
          loser_id: players(:alice).id,
          played_at: Time.current
        }
      }
    end
    assert_response :unprocessable_entity
  end
end
