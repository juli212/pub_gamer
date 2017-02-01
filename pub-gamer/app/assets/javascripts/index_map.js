$(document).ready(function() {
	var mapNotVisible = true
	$('.view-box').first().toggle()
	$('#toggle-venue-view-links a').first().css('text-decoration', 'none').addClass('selected-view')
	$('#toggle-venue-view-links').on('click', 'a', function(event){
		event.preventDefault();
		var mapStatus = mapNotVisible
		mapNotVisible = toggleViewVisibility(this, mapNotVisible)
		if ( $(this).is('#map') && mapStatus ){
			if ( this.href.includes("venue") ){
				allVenuesMap(venuesFound)
			} else if ( this.href.includes("event") ){
				allEventsMap(eventsFound)
			}
		}
	})
})

function toggleViewVisibility(link, visibility) {
	if (!$(link).hasClass('selected-view')) {
		$('.view-box').toggle()
		$('.selected-view').css('text-decoration', 'underline').removeClass('selected-view')
		$(link).addClass('selected-view')
		$(link).css('text-decoration', 'none')
		return !visibility
	} else {
		return visibility
	}
}

function allEventsMap(events) {
	var events = events
	var eventVenues = []
	for (var i = 0; i < events.length; i++){
		eventVenues[i] = events[i].venue
	}
	allVenuesMap(eventVenues, eventArray = events);
}

function allVenuesMap(venues){
  var markers = [];
  var allVenues = venues
  var mapElement = document.getElementById('all-venues-map');
  var mapOptions = {
    center: { lat: 40.72, lng: -73.96 },
    zoom: 11,
    mapTypeId: 'roadmap'
  }
  var map = new google.maps.Map(mapElement, mapOptions);
  
  if (typeof eventArray == "undefined") {
    venueMarkers(markers, allVenues, map);
  } else {
    eventVenueMarkers(markers, eventArray, map)
  }
}

function venueMarkers(markers, venues, map) {
  for (var i = 0; i < venues.length; i++) {
    var link = "/venues/" + venues[i].id
    markers[i] = new google.maps.Marker({
      position: { lat: parseFloat(venues[i].lat), lng: parseFloat(venues[i].lng) },
      id: i,
      map: map,
      link: "<a href=" + link + ">" + venues[i].name + "</a>",
      address: venues[i].address,
      name: venues[i].name
    });
      
    google.maps.event.addListener(markers[i], 'click', function(){
      var infowindow = new google.maps.InfoWindow({
        content: createVenueWindow(this.link, this.address),
        position:this.getPosition()
      });
      infowindow.open(map);
    });
  }
}

function eventVenueMarkers(markers, events, map) {
  for (var i = 0; i < events.length; i++) {
    var eventLink = "/events/" + events[i].id
    var venueLink = "/venues/" + events[i].venue.id
    var timeDate = "<div><div class='date-background'></div>" + events[i].startdate + "&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;" + "<div class='time-background'></div>" + events[i].starttime + "</div>"
    var date = events[i].startdate
    var time = events[i].starttime
    markers[i] = new google.maps.Marker({
      position: { lat: parseFloat(events[i].venue.lat), lng: parseFloat(events[i].venue.lng) },
      id: i,
      map: map,
      eventLink: "<a href=" + eventLink + ">" + events[i].title + "</a>",
      venueLink: "<a href=" + venueLink + ">" + events[i].venue.name + "</a>",
      address: events[i].venue.address,
      timeDate: timeDate,
      time: time,
      date: date
    });
      
    google.maps.event.addListener(markers[i], 'click', function(){
      var infowindow = new google.maps.InfoWindow({
        content: createEventWindow(this.eventLink, this.date, this.time, this.venueLink, this.address ),
        position:this.getPosition()
      });
      infowindow.open(map);
    });
  }
}

var createVenueWindow = function(venueName, address) {
  var box = "<div class='index-map-infowindow'>" +
    "<div class='header text-center'><h5>" + venueName + "</h5></div>"
    + "<div class='row-1'><div class='location-background'></div>" + 
    "<p>" + address + "</p></div></div>"
  return box
}

var createEventWindow = function(eventTitle, date, time, venueName, address) {
  var box = "<div class='index-map-infowindow'>" +
    "<div class='header text-center'><h5>" + eventTitle + "</h5></div>"
    + "<div class='row-1'><div class='date-box text-center'>" + 
    "<div class='date-background'></div><p>" + date + "</p></div>" + 
    "<div class='time-box text-center'><div class='time-background'></div><p>" + time + "</p></div></div>" +
    "<div class='row-2'>" +
    "<div class='shop-background'></div><p>" + venueName + "</p></div>" +
    "<div class='row-3'>" +
    "<div class='location-background'></div><p>" + address + "</p></div></div>"
  return box
}
