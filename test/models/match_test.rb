require "test_helper"

class MatchTest < ActiveSupport::TestCase
  test "valid match" do
    match = Match.new(
      winner: players(:alice),
      loser: players(:bob),
      played_at: Time.current
    )
    assert match.valid?
  end

  test "played_at must be present" do
    match = Match.new(
      winner: players(:alice),
      loser: players(:bob),
      played_at: nil
    )
    assert_not match.valid?
    assert_includes match.errors[:played_at], "can't be blank"
  end

  test "winner and loser must be different" do
    match = Match.new(
      winner: players(:alice),
      loser: players(:alice),
      played_at: Time.current
    )
    assert_not match.valid?
    assert_includes match.errors[:base], "Winner and loser must be different players"
  end

  test "winner must be present" do
    match = Match.new(
      loser: players(:bob),
      played_at: Time.current
    )
    assert_not match.valid?
  end

  test "loser must be present" do
    match = Match.new(
      winner: players(:alice),
      played_at: Time.current
    )
    assert_not match.valid?
  end
end
