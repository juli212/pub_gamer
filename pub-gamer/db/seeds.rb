# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


games = Game.create([{ name: 'pool'}, {name: 'fooseball'}, {name: 'shuffleboard'}, {name: 'darts'}, {name: 'skeeball'}, {name: 'ping-pong'}])

users = User.create([{user_name: "julia", password: "password", email: "julia@julia.com"}, {user_name: "alex", password: "password", email: "alex@alex.com"}])

venues = Venue.create([
	{name: "Slainte Bar and Lounge",
		address: "304 Bowery, New York, NY 10012, USA"}, 
	{name: "The Iron Horse NYC", 
		address: "32 Cliff St, New York, NY 10038, USA"},
	{name: "Welcome To The Johnsons",
  	address: "123 Rivington St, New York, NY 10002, USA" },
  {name: "Parkside Lounge",
  	address: "317 E Houston St, New York, NY 10002, USA"},
  {name: "Bar Nine",
  	address: "807 9th Ave, New York, NY 10019, USA"},
  {name: "Iona",
  	address: "180 Grand St, Brooklyn, NY 11211, USA"},
	{name: "Banter Bar",
  	address: "132 Havemeyer St, Brooklyn, NY 11211, USA"},
  {name: "The Edge",
  	address: "95 E 3rd St, New York, NY 10003, USA"},
  {name: "The Irish American Pub",
  	address: "17 John St, New York, NY 10038, USA"}
])

vibes = Vibe.create([
  {name: 'serious', pic: 'angryFace.gif'}, 
  {name: 'loud', pic: 'happyFace.gif'}, 
  {name: 'chill', pic: 'sadFace.gif'}, 
  {name: 'pretentious', pic: 'angryFace.gif'}, 
  {name: 'expensive', pic: 'happyFace.gif'}, 
  {name: 'douchey', pic: 'starFace.gif'}, 
  {name: 'fun', pic: 'happyFace.gif'}, 
  {name: 'divey', pic: 'starFace.gif'}], 
  {name: 'sophisticated', pic: 'happyFace.gif'}, 
  {name: 'preppy',pic: 'sadFace.gif'})