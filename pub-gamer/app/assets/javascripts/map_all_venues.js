

function allVenuesMap(){
	var markers = [];
	var allVenues = venuesFound
  var mapElement = document.getElementById('all-venues-map');
	var mapOptions = {
		center: { lat: 40.72, lng: -73.96 },
		zoom: 11,
		mapTypeId: 'roadmap'
	}
	var map = new google.maps.Map(mapElement, mapOptions);

  for (var i = 0; i < allVenues.length; i++) {
  	var link = "/venues/" + allVenues[i].id
    markers[i] = new google.maps.Marker({
      position: { lat: parseFloat(allVenues[i].lat), lng: parseFloat(allVenues[i].lng) },
      id: i,
      map: map,
      link: "<a href=" + link + ">" + allVenues[i].name + "</a>",
      address: allVenues[i].address,
      name: allVenues[i].name
    });
      
    google.maps.event.addListener(markers[i], 'click', function(){
      var infowindow = new google.maps.InfoWindow({
        content: this.link + "<br><p>" + this.address + "</p>",
        position:this.getPosition()
      });
      infowindow.open(map);
    });
  }
}

