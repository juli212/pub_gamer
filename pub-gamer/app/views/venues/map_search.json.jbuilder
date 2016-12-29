json.array!(@venues) do |venue|

	json.placeId				venue.place
	json.placeName			venue.name
	
end