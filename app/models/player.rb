class Player < ApplicationRecord
  GENDERS = %w[Male Female].freeze

  has_many :won_matches, class_name: "Match", foreign_key: :winner_id, dependent: :destroy
  has_many :lost_matches, class_name: "Match", foreign_key: :loser_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
end
