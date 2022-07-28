# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

CSV.open(Rails.root.join("config/pantones.csv"), headers: true).each do |row|
  Color.find_or_create_by(name: row["name"]) do |col|
    col.value = row["hex"]
  end
end

[
  "food & beberage", 
].each do |name|
  Industry.find_or_create_by(name: name)
end