require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  test "valid player" do
    player = Player.new(name: "Diana", gender: "Female")
    assert player.valid?
  end

  test "name must be present" do
    player = Player.new(name: "", gender: "Female")
    assert_not player.valid?
    assert_includes player.errors[:name], "can't be blank"
  end

  test "name must be unique" do
    Player.create!(name: "Diana", gender: "Female")
    duplicate = Player.new(name: "Diana", gender: "Male")
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:name], "has already been taken"
  end

  test "gender must be present" do
    player = Player.new(name: "Diana", gender: "")
    assert_not player.valid?
    assert_includes player.errors[:gender], "can't be blank"
  end

  test "gender must be Male or Female" do
    player = Player.new(name: "Diana", gender: "Unknown")
    assert_not player.valid?
    assert_includes player.errors[:gender], "is not included in the list"
  end

  test "destroying player destroys associated won matches" do
    player = players(:alice)
    assert_difference "Match.count", -1 do
      player.destroy
    end
  end
end
