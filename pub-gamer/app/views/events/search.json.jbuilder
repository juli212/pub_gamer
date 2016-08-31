json.array!(@results) do |result|
  json.name					 result.name
  json.address			 result.search_location
  json.id						 result.id
end

