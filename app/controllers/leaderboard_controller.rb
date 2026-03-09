class LeaderboardController < ApplicationController
  def index
    @players = Player
      .select(
        "players.*",
        "(SELECT COUNT(*) FROM matches WHERE matches.winner_id = players.id) AS wins",
        "(SELECT COUNT(*) FROM matches WHERE matches.loser_id = players.id) AS losses"
      )
      .order("wins DESC, losses ASC")
  end
end
