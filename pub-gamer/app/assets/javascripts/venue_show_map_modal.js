$(document).ready(function() {
	$('#view-venue-on-map').dialog({
		modal: true,
		autoOpen: false,
		open: showMap,
		height: screen.height * 0.6,
		width: $(window).width() * 0.7,
		position: ({my:'top', at: 'middle', of: '.top-bar'})
	});
	$('#view-map').on('click', function(event){
		event.preventDefault();
		$('#view-venue-on-map').dialog('open');
	})
})

var showMap = function venueShowMap() {
  var map = new google.maps.Map(document.getElementById('show-map'), {
    zoom: 8,
    center: {lat: 40.72, lng: -73.96}
  });
  var geocoder = new google.maps.Geocoder;
  var infowindow = new google.maps.InfoWindow;

  geocodePlaceId(geocoder, map, infowindow);

	function geocodePlaceId(geocoder, map, infowindow) {
	  var placeId = $('#place-id').val()
	  geocoder.geocode({'placeId': placeId}, function(results, status) {
	    if (status === 'OK') {
	      if (results[0]) {
	        map.setZoom(17);
	        map.setCenter(results[0].geometry.location);
	        var marker = new google.maps.Marker({
	          map: map,
	          position: results[0].geometry.location
	        });
	        infowindow.setContent(results[0].formatted_address);
	        infowindow.open(map, marker);
	      } else {
	        window.alert('No results found');
	      }
	    } else {
	      window.alert('Geocoder failed due to: ' + status);
	    }
	  });
	}

}