# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Transaction.destroy_all
puts 'User with transactions Seed start'
100.times do
  id = User.create!(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}").id
  6.times do
    Transaction.create!(sum: rand(100)-50, user_id: id)
  end
end
