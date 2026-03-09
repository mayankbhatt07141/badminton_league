# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

return if Player.any?

puts "Seeding players..."
alice = Player.create!(name: "Alice", gender: "Female")
bob = Player.create!(name: "Bob", gender: "Male")
charlie = Player.create!(name: "Charlie", gender: "Male")
diana = Player.create!(name: "Diana", gender: "Female")

Match.create!(winner: alice, loser: bob, played_at: 1.week.ago)
Match.create!(winner: alice, loser: charlie, played_at: 6.days.ago)
Match.create!(winner: bob, loser: charlie, played_at: 5.days.ago)
Match.create!(winner: bob, loser: diana, played_at: 4.days.ago)
Match.create!(winner: charlie, loser: diana, played_at: 3.days.ago)
