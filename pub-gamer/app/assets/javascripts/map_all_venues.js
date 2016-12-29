function allVenuesMap(venues, allMarkers) {
	var allVenues = venuesFound
	var mapElement = document.getElementById('all-venues-map');
	var mapOptions = {
		center: { lat: 40.72, lng: -73.96 },
		zoom: 11,
		mapTypeId: 'roadmap'
	}
	var map = new google.maps.Map(mapElement, mapOptions)

  for (i = 0; i < allVenues.length; i++) {
  	var venue = allVenues[i]
  	createMarker(venue, map);
  }
}

function createMarker(data, map) {
	var service = new google.maps.places.PlacesService(map);
	service.getDetails({
		placeId: data.place
	}, function(result, status) {
		if (status != google.maps.places.PlacesServiceStatus.OK) {
			alert(status);
			return;
		}
		var marker = new google.maps.Marker({
			map: map,
			place: {
				placeId: data.place,
				location: result.geometry.location
			}
		});
		infoBox(map, marker, data, result);
	});
}

function infoBox(map, marker, data, result) {
	var infoWindow = new google.maps.InfoWindow();
	google.maps.event.addListener(marker, "click", function(event) {
		infoWindow.setContent(data.name);
		infoWindow.open(map, marker);
	});
	(function(marker, data) {
		google.maps.event.addListener(marker, "click", function(event) {
			var link = "/venues/" + data.id
			infoWindow.setContent("<a href=" + link + ">" + data.name + "</a><br><p>" + result.formatted_address + "</p>");
			infoWindow.open(map, marker);
		});
	})(marker, data);
}
