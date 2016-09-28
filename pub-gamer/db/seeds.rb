# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


games = Game.create([{ name: 'pool'}, {name: 'fooseball'}, {name: 'shuffleboard'}, {name: 'darts'}, {name: 'skeeball'}, {name: 'ping-pong'}])

users = User.create([{user_name: "julia", password: "password", email: "julia@julia.com"}, {user_name: "alex", password: "password", email: "alex@alex.com"}])

neighborhoods = Neighborhood.create([
  { name: 'Lower Manhattan'},
  { name: 'Williamsburg'},
  { name: 'Midtown'}
])

venues = Venue.create([
	{name: "Slainte Bar and Lounge",
		address: "304 Bowery, New York, NY 10012, USA",
    place: "ChIJkQhyD4VZwokRkuLC_HdUQsU",
    neighborhood_id: 1 }, 
	{name: "The Iron Horse NYC", 
		address: "32 Cliff St, New York, NY 10038, USA",
    place: "ChIJKwU9OD1awokRQIUbiv9EgPM",
    neighborhood_id: 1 },
	{name: "Welcome To The Johnsons",
  	address: "123 Rivington St, New York, NY 10002, USA",
    place: "ChIJD5T-FIFZwokRKLQDKrQ68-0",
    neighborhood_id: 1 },
  {name: "Parkside Lounge",
  	address: "317 E Houston St, New York, NY 10002, USA",
    place: "ChIJv2vIB4JZwokRQbbrk0W6I88",
    neighborhood_id: 1 },
  {name: "Bar Nine",
  	address: "807 9th Ave, New York, NY 10019, USA",
    place: "ChIJr3VP4FlYwokRcyikcDo79w8",
    neighborhood_id: 3 },
  {name: "Iona",
  	address: "180 Grand St, Brooklyn, NY 11211, USA",
    place: "ChIJhxiuQmBZwokR-arCbRYMzdQ",
    neighborhood_id: 2 },
	{name: "Banter Bar",
  	address: "132 Havemeyer St, Brooklyn, NY 11211, USA",
    place: "ChIJv6BWj19ZwokRISnmtQh0HTQ",
    neighborhood_id: 2 },
  {name: "Edge Bar",
  	address: "95 E 3rd St, New York, NY 10003, USA",
    place: "ChIJlYfAaYNZwokRUYk1BIpM8dM",
    neighborhood_id: 1 },
  {name: "The Irish American Pub",
  	address: "17 John St, New York, NY 10038, USA",
    place: "ChIJ4ayAJRhawokRjzLOsdPWMCs",
    neighborhood_id: 1 },
  {name: "Cherry Tavern",
    address: "441 E 6th st, New York, NY 10009, USA",
    place: "ChIJc2yQSp1ZwokRjcWYA96Gmzg",
    neighborhood_id: 1},
  {name: "Alligator Lounge",
    address: "600 Metropolitan Ave, Brooklyn, NY 11211, USA",
    place: "ChIJi72NxllZwokROkAxMMbU_nw",
    neighborhood_id: 2 },
  {name: "Double Down Saloon",
    address: "14 Avenue A, New York, NY 10009, USA",
    place: "ChIJRZhgTIJZwokR5ZRVoHE3tlw",
    neighborhood_id: 1 }
])

vibes = Vibe.create([  
  {name: 'Chill', pic: 'chillVibePurple.png'},
  {name: 'Pricey', pic: 'expensiveVibePurple.png'},
  {name: 'Divey', pic: 'diveyVibePurple.png'}])


VenueGame.create([
  {game_id: 1, venue_id: 1},
  {game_id: 3, venue_id: 1},
  {game_id: 1, venue_id: 2},
  {game_id: 1, venue_id: 3},
  {game_id: 1, venue_id: 4},
  {game_id: 2, venue_id: 4},
  {game_id: 4, venue_id: 4},
  {game_id: 1, venue_id: 5},
  {game_id: 4, venue_id: 5},
  {game_id: 5, venue_id: 5},
  {game_id: 6, venue_id: 6},
  {game_id: 2, venue_id: 7},
  {game_id: 4, venue_id: 7},
  {game_id: 1, venue_id: 8},
  {game_id: 1, venue_id: 9},
  {game_id: 1, venue_id: 10},
  {game_id: 5, venue_id: 11},
  {game_id: 4, venue_id: 11},
  {game_id: 1, venue_id: 11},
  {game_id: 1, venue_id: 12}
])
