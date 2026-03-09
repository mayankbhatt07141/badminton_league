require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get players_path
    assert_response :success
    assert_select "h1", "Players"
  end

  test "should get show" do
    get player_path(players(:alice))
    assert_response :success
    assert_select "h1", "Alice"
  end

  test "should get new" do
    get new_player_path
    assert_response :success
    assert_select "h1", "Add New Player"
  end

  test "should create player" do
    assert_difference "Player.count", 1 do
      post players_path, params: { player: { name: "Diana", gender: "Female" } }
    end
    assert_redirected_to players_path
    follow_redirect!
    assert_select ".notice", "Player was successfully added."
  end

  test "should not create player with blank name" do
    assert_no_difference "Player.count" do
      post players_path, params: { player: { name: "", gender: "Female" } }
    end
    assert_response :unprocessable_entity
  end

  test "should destroy player" do
    player = players(:charlie)
    assert_difference "Player.count", -1 do
      delete player_path(player)
    end
    assert_redirected_to players_path
  end
end
