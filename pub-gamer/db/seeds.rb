# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


games = Game.create([{ name: 'pool'}, {name: 'fooseball'}, {name: 'shuffleboard'}, {name: 'darts'}, {name: 'skeeball'}])

User.create(user_name: "julia", password: "password", email: "julia@julia.com")

venues = Venue.create([{name: "Slainte Bar and Lounge",
  address: "304 Bowery, New York, NY 10012, USA"}, {name: "The Iron Horse NYC", address: "32 Cliff St, New York, NY 10038, USA"}])