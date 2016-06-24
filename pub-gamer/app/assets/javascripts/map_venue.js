function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 40.7118739, lng: -74.002533},
    zoom: 13,
  });

  var input = document.getElementById('pac-input');

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);

  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
    map: map
  });
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });

  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      return;
    }

    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
    }

    // Set the position of the marker using the place ID and location.
    marker.setPlace({
      placeId: place.place_id,
      location: place.geometry.location
    });
    marker.setVisible(true);
// debugger;
  document.getElementById('venue_name').value = place.name;
  document.getElementById('venue_address').value = place.formatted_address;
  document.getElementById('venue_place').value = place.place_id

    var phone = place.formatted_phone_number || "No Phone Number"

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
        place.formatted_address + '<br>' + phone);
    infowindow.open(map, marker);
  });
}
