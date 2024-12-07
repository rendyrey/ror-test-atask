# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Entity.create!([
  { entity_name: "User", entity_type: "user" },
  { entity_name: "Team", entity_type: "team" },
  { entity_name: "Stock", entity_type: "stock" }
])


Account.create({ name: "Rendy", email: "rendyreynaldy@yopmail.com", password: "password" })
Account.create({ name: "Steve", email: "steve@yopmail.com", password: "password" })


Wallet.create!([
  { account_id: 1, entity_id: 1, balance: 1000000 },
  { account_id: 1, entity_id: 2, balance: 2000000 },
  { account_id: 1, entity_id: 3, balance: 3000000 },
  { account_id: 2, entity_id: 1, balance: 1000000 },
  { account_id: 2, entity_id: 2, balance: 2000000 },
  { account_id: 2, entity_id: 3, balance: 3000000 }
])
