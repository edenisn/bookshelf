# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin user
User.create!(email: "admin@test.com", password: "admin123", password_confirmation: "admin123")

1.upto(2000) do |i|
  User.create!(email: "test#{i}@test.com", password: "12345678", password_confirmation: "12345678")
end
