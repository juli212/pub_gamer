# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


games = Game.create([{ name: 'pool'}, {name: 'fooseball'}, {name: 'shuffleboard'}, {name: 'darts'}, {name: 'skeeball'}, {name: 'ping-pong'}, {name: 'karaoke'}, {name: 'cards'}, {name: 'chess'}, {name: 'arcade'}, {name: 'boardgames'}])

users = User.create([
  {user_name: "julia", first_name: "Julia", last_name: "Giraldi", password: "password", birthday: '26 Jan 1990', bio: "i am pretty awesome. I play all of the soccer. Hike lots. And eat things pretty often.", email: "julia@julia.com"}, 
  {user_name: "alex", first_name: "Alex", last_name: "Forger", password: "password", birthday: '26 Jan 1987', bio: "i am alex. i play guitar. I also do other things...", email: "alex@alex.com"}])

neighborhoods = Neighborhood.create([
  { name: 'Lower Manhattan'}, { name: 'Williamsburg'}, { name: 'Midtown'}, { name: 'Alphabet City'}, { name: 'Astoria'}, { name: 'Bay Ridge'}, { name: 'Bedford Stuyvesant'}, { name: 'Boerum Hill'}, { name: 'Bowery'}, { name: 'Brooklyn Heights'}, { name: 'Bushwick'}, { name: 'Carroll Gardens'}, { name: 'Chelsea'}, { name: 'Chinatown'}, { name: 'Clinton Hill'}, { name: 'Cobble Hill'}, { name: 'Crown Heights'}, { name: 'Ditmas Park'}, { name: 'Dumbo'}, { name: 'East Harlem'}, { name: 'East Village'}, { name: 'Financial District'}, { name: 'Flatbush'}, { name: 'Flatiron'}, { name: 'Fort Green'}, { name: 'Gowanus'}, { name: 'Gramercy'}, { name: 'Greenwich Village'}, { name: 'Greenpoint'}, { name: 'Hamilton Heights'}, { name: 'Harlem'}, { name: 'Hells Kitchen'}, { name: 'Inwood'}, { name: 'Kips Bay'}, { name: 'Lenox Hill'}, { name: 'Long Island City'}, { name: 'Lower East Side'}, { name: 'Manhattan Valley'}, { name: 'Meatpacking'}, { name: 'Midtown'}, { name: 'Morningside Heights'}, { name: 'Murray Hill'}, { name: 'NoHo'}, { name: 'Park Slope'}, { name: 'Prospect Heights'}, { name: 'Prospect Park'}, { name: 'Prospect Park South'}, { name: 'Red Hook'}, { name: 'Upper East Side'}, { name: 'Upper West Side'}, { name: 'Sunnyside'}, { name: 'Sunset Park'}, { name: 'SoHo'}, { name: 'Tribecca'}, { name: 'Washington Heights'}, { name: 'West Village'}, { name: 'Yorkville'}
])

venues = Venue.create([
	{name: "Slainte Bar and Lounge",
		address: "304 Bowery, New York, NY 10012",
    place: "ChIJkQhyD4VZwokRkuLC_HdUQsU",
    neighborhood_id: Neighborhood.find_or_create_by(name: "East Village").id }, 
	{name: "The Iron Horse NYC", 
		address: "32 Cliff St, New York, NY 10038",
    place: "ChIJKwU9OD1awokRQIUbiv9EgPM",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Financial District").id },
	{name: "Welcome To The Johnsons",
  	address: "123 Rivington St, New York, NY 10002",
    place: "ChIJD5T-FIFZwokRKLQDKrQ68-0",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Lower East Side").id },
  {name: "Parkside Lounge",
  	address: "317 E Houston St, New York, NY 10002",
    place: "ChIJv2vIB4JZwokRQbbrk0W6I88",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Lower East Side").id },
   {name: "Bar Nine",
  	address: "807 9th Ave, New York, NY 10019",
    place: "ChIJr3VP4FlYwokRcyikcDo79w8",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Hells Kitchen").id },
  {name: "Iona",
  	address: "180 Grand St, Brooklyn, NY 11211",
    place: "ChIJhxiuQmBZwokR-arCbRYMzdQ",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Williamsburg").id },
	{name: "Banter Bar",
  	address: "132 Havemeyer St, Brooklyn, NY 11211",
    place: "ChIJv6BWj19ZwokRISnmtQh0HTQ",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Williamsburg").id },
  {name: "Edge Bar",
  	address: "95 E 3rd St, New York, NY 10003",
    place: "ChIJlYfAaYNZwokRUYk1BIpM8dM",
    neighborhood_id: Neighborhood.find_or_create_by(name: "East Village").id },
  {name: "The Irish American Pub",
  	address: "17 John St, New York, NY 10038",
    place: "ChIJ4ayAJRhawokRjzLOsdPWMCs",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Financial District").id },
  {name: "Cherry Tavern",
    address: "441 E 6th st, New York, NY 10009",
    place: "ChIJc2yQSp1ZwokRjcWYA96Gmzg",
    neighborhood_id: Neighborhood.find_or_create_by(name: "East Village").id },
  {name: "Alligator Lounge",
    address: "600 Metropolitan Ave, Brooklyn, NY 11211",
    place: "ChIJi72NxllZwokROkAxMMbU_nw",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Williamsburg").id },
  {name: "Double Down Saloon",
    address: "14 Avenue A, New York, NY 10009",
    place: "ChIJRZhgTIJZwokR5ZRVoHE3tlw",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Lower East Side").id },
  {name: "1020 Bar",
    address: "1020 Amsterdam Ave, New York, NY 10025",
    place: "ChIJ7SZK6zz2wokRpjhEZIwDNLg",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Morningside Heights").id },
  {name: "40 Knots Bar",
    address:"200 Columbia St, Brooklyn, NY 11231",
    place: "ChIJWcexSFxawokRJWVcJEOJMA4",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Carroll Gardens").id },
  {name: "Abilene",
    address: "442 Court St, Brooklyn, NY 11231",
    place: "ChIJ2TXRiVhawokRvAlAEg3QVtE",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Carroll Gardens").id },
  {name: "Ace Bar",
    address: "531 E 5th St, New York, NY 10009q",
    place: "ChIJuddLo4JZwokRdm_oW8FoWN4",
    neighborhood_id: Neighborhood.find_or_create_by(name: "East Village").id },
  {name: "Union Hall",
    address: "702 Union St, Brooklyn, NY 11215",
    place: "ChIJ43tYfapbwokRnkJq38aBk_M",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Park Slope").id },
  {name: "The Carriage House",
    address: "219 E 59th St, New York, NY 10022",
    place: "ChIJp18_3uVYwokRMEDmAlz_GYo",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Lenox Hill").id },
  {name: "Fat Black Pussycat",
    address: "130 W 3rd St, New York, NY 10012",
    place: "ChIJUzSA1pNZwokRXIM_Ln81TZc",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Greenwich Village").id },
  {name: "Alibi NYC Soho Salon",
    address: "67 Greene St, New York, NY 10012",
    place: "ChIJuURJAYxZwokRI7hCsVDgO88",
    neighborhood_id: Neighborhood.find_or_create_by(name: "SoHo").id },
  {name: "Angry Wade's",
    address: "222 Smith St, Brooklyn, NY 11231",
    place: "ChIJNVhF-1BawokRG2i4lLPyqqs",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Carroll Gardens").id },
  {name: "169 Bar",
    address: "169 E Broadway, New York, NY 10002",
    place: "ChIJVeXRdylawokRJYXkLU8yMpE",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Lower East Side").id },
  {name: "Barfly",
    address: "244 3rd Ave, New York, NY 10010",
    place: "ChIJLVH0QaBZwokRGivIPQcDKU4",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Gramercy Park").id },
  {name: "Battery Harris",
    address: "64 Frost St, Brooklyn, NY 11211",
    place: "ChIJ3WxVXVpZwokRIjTixoew3T4",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Williamsburg").id },
  {name: "Blue Ruin",
    address: "538 9th Ave, New York, NY 10018",
    place: "ChIJJ1ZxtlJYwokRU2Ysk8JPqgM",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Hell's Kitchen").id },
  {name: "Bull McCABE'S",
    address: "29 St Marks Pl, New York, NY 10003",
    place: "ChIJpVqBe5xZwokRMIOr6FtZg9Y",
    neighborhood_id: Neighborhood.find_or_create_by(name: "East Village").id },
  {name: "Canal Bar",
    address: "270 3rd Ave # A, Brooklyn, NY 11215",
    place: "ChIJN7FyClVawokRsq3fIOUBa9s",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Gowanus").id },
  {name: "Dave's Tavern",
    address: "574 9th Ave, New York, NY 10036",
    place: "ChIJTXpP7lJYwokRniLvHyM0IWk",
    neighborhood_id: Neighborhood.find_or_create_by(name: "Hell's Kitchen").id },
  {name: "Doc Holliday's",
    address: "141 Avenue A, New York, NY 10009",
    place: "ChIJwRcz2HdZwokR_I0BuB3PkFc",
    deleted: false,
    neighborhood_id: Neighborhood.find_or_create_by(name: "East Village").id }
  # {name: "",
  #   address: "",
  #   place: "",
  #   neighborhood_id: },
  # {name: "",
  #   address: "",
  #   place: "",
  #   neighborhood_id: }
])



# 1020 bar: pool/darts *
# 40 knots bar: pool *
# abileen: scrabble *
# Ace bar: darts/billiards/pinball/skeeball *
# alibi: pool *
# angry wade's: pool/darts *
# b side: pool 
# bar 169: pool *
# barfly ny: pool, darts *
# battery harris: pool *
# billymark's west: pool
# bleeker st. bar: pool
# blue ruin: pool *
# bull mcCabes: pool/darts *
# canal bar: pool *
# dave's tavern: pool *
# doc holiday's: pool *
# dusk: pool
# failte: pool/darts
# fat black pussycat: pool *
# fat cat: pool/shuffleboard/pingpong/chess
# floyd, ny: bocce ball
# full circle: skeeball
# galway hooker: pool/darts (different than galway hooker downtown-pool)
# halyards: pool
# hank's saloon: pool
# hi-fi: pool
# jakes dilemma: pool
# josie wood's pub: pool/darts
# kelly's: pool
# landsdowne road: pool/darts
# legends: pool/darts
# lucky jacks: pool
# lucy's: pool/pinball
# mad hatter saloon: pool/darts
# manitoba's: airhockey
# mission dolores: pinball
# mona's: pool
# montero's bar and grill: pool/karaoke
# nancy whiskey: shuffle puck
# nowhere: pool
# O'hanlons: pool/darts
# paddy maguires ale house: pool/darts
# peter dillons: pool
# ryan's daughter: pool
# royal palms: shuffleboard
# sixth ward: pool
# slate: pingpong/pool/etc
# snafu: pool
# sophie's: pool
# tempest bar: pool
# the carriage house: pool/karaoke/darts *
# the duck: pool/mortal kombat
# the hog pit nyc: pool
# the levee: pool
# the patriot: pool
# the whiskey brooklyn: shuffleboard/skeeball 
# the whiskey ward: pool
# turkey's nest tavern: pool
# tropical 128: pool
# union hall: bocce ball *
# walter's bar: pool/darts
# zablozki's: pool

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
