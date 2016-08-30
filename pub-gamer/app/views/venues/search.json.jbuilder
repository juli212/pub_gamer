json.array!(@results) do |result|
  json.name					 result.name
  json.address			 result.search_address
  json.id						 result.id
end

