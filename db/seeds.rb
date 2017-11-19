# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.last

10.times do
  @user.characters.create(
    pseudo: Faker::Name.name,
    server: 'Nidas',
    category: 'Cra',
    level: 2
  )
end

10.times do
  Group.create(
    user_leader: @user.id,
    name: Faker::LeagueOfLegends.quote,
    minp: 2,
    maxp: rand(2..8),
    levelp: rand(0..8),
    range: rand(0..10),
    server: 'Nidas',
    fight_type: true,
    status: 0
  )
end
