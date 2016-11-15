# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


games = Game.create([{ name: 'pool'}, {name: 'fooseball'}, {name: 'shuffleboard'}, {name: 'darts'}, {name: 'skeeball'}, {name: 'ping-pong'}, {name: 'karaoke'}, {name: 'cards'}, {name: 'chess'}, {name: 'arcade'}, {name: 'boardgames'}])

users = User.create([
  {user_name: "julia", first_name: "Julia", last_name: "Giraldi", password: "password", age: 26, bio: "i am pretty awesome. I play all of the soccer. Hike lots. And eat things pretty often.", email: "julia@julia.com"}, 
  {user_name: "alex", first_name: "Alex", last_name: "Forger", password: "password", age: 29, bio: "i am alex. i play guitar. I also do other things...", email: "alex@alex.com"}])

neighborhoods = Neighborhood.create([
  { name: 'Lower Manhattan'},
  { name: 'Williamsburg'},
  { name: 'Midtown'}
])

venues = Venue.create([
	{name: "Slainte Bar and Lounge",
		address: "304 Bowery, New York, NY 10012",
    place: "ChIJkQhyD4VZwokRkuLC_HdUQsU",
    neighborhood_id: 1 }, 
	{name: "The Iron Horse NYC", 
		address: "32 Cliff St, New York, NY 10038",
    place: "ChIJKwU9OD1awokRQIUbiv9EgPM",
    neighborhood_id: 1 },
	{name: "Welcome To The Johnsons",
  	address: "123 Rivington St, New York, NY 10002",
    place: "ChIJD5T-FIFZwokRKLQDKrQ68-0",
    neighborhood_id: 1 },
  {name: "Parkside Lounge",
  	address: "317 E Houston St, New York, NY 10002",
    place: "ChIJv2vIB4JZwokRQbbrk0W6I88",
    neighborhood_id: 1 },
   {name: "Bar Nine",
  	address: "807 9th Ave, New York, NY 10019",
    place: "ChIJr3VP4FlYwokRcyikcDo79w8",
    neighborhood_id: 3 },
  {name: "Iona",
  	address: "180 Grand St, Brooklyn, NY 11211",
    place: "ChIJhxiuQmBZwokR-arCbRYMzdQ",
    neighborhood_id: 2 },
	{name: "Banter Bar",
  	address: "132 Havemeyer St, Brooklyn, NY 11211",
    place: "ChIJv6BWj19ZwokRISnmtQh0HTQ",
    neighborhood_id: 2 },
  {name: "Edge Bar",
  	address: "95 E 3rd St, New York, NY 10003",
    place: "ChIJlYfAaYNZwokRUYk1BIpM8dM",
    neighborhood_id: 1 },
  {name: "The Irish American Pub",
  	address: "17 John St, New York, NY 10038",
    place: "ChIJ4ayAJRhawokRjzLOsdPWMCs",
    neighborhood_id: 1 },
  {name: "Cherry Tavern",
    address: "441 E 6th st, New York, NY 10009",
    place: "ChIJc2yQSp1ZwokRjcWYA96Gmzg",
    neighborhood_id: 1},
  {name: "Alligator Lounge",
    address: "600 Metropolitan Ave, Brooklyn, NY 11211",
    place: "ChIJi72NxllZwokROkAxMMbU_nw",
    neighborhood_id: 2 },
  {name: "Double Down Saloon",
    address: "14 Avenue A, New York, NY 10009",
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
