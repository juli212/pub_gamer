json.array!(@results) do |result|
  json.name					 result.name
  json.address			 result.address
  json.id						 result.id
end