function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 40.7118739, lng: -74.002533},
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    mapTypeControl: false,
    streetViewControl: false
  });

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
    map: map
  });

// keep a reference to the original setPosition-function
  var sP = google.maps.InfoWindow.prototype.setPosition;
  var sC = google.maps.InfoWindow.prototype.setContent;

  //override the built-in setContent-method
  google.maps.InfoWindow.prototype.setContent = function (content) {
    //argument is a node
    if (content.querySelector) {
      var structureContent = "<div><div class='info-window-line-1'></div><div class='info-window-line-2'></div><div class='info-window-line-3'></div><div class='info-window-line-4'><button class='button create-venue' type='button'>Select Venue!</button></div></div>"
      $(content).html(structureContent);
    }
      //run the original setContent-method
    sC.apply(this, arguments);
  };

// //override the built-in setPosition-method
  google.maps.InfoWindow.prototype.setPosition = function () {

//   //logAsInternal isn't documented, but as it seems
//   //it's only defined for InfoWindows opened on POI's
  if (this.logAsInternal) {
    google.maps.event.addListenerOnce(this, 'map_changed',function () {
      var map = this.getMap();
    });
  }
//   //call the original setPosition-method
  sP.apply(this, arguments);
  };

  google.maps.event.addListener(map,'click',function(e){

    var lat = e.latLng.lat().toString()
    var lng = e.latLng.lng().toString()
    // var dateNow = Date.

    $.ajax({
      url:"https://maps.googleapis.com/maps/api/timezone/json?location=" + lat + "," + lng + "&timestamp="+(Math.round((new Date().getTime())/1000)).toString()+"&sensor=false",
    }).done(function(response){
       if(response.timeZoneId != null){
         //do something
       }
    });
    $('#venue_place').val(e.placeId)
    $('#venue_lat').val(lat)
    $('#venue_lng').val(lng)
    var iD = e.placeId 
    var request = {
      placeId: iD
    };

    service = new google.maps.places.PlacesService(map);
    service.getDetails(request, callback);

    function callback(place, status) {
      if (status == google.maps.places.PlacesServiceStatus.OK) {
        debugger;
        var venueAddressLine1 = place.address_components[0].short_name + ' ' + place.address_components[1].short_name
        var venueAddressLine2 = place.address_components[3].short_name + ', ' + place.address_components[5].short_name + ' ' + place.address_components[7].short_name
          $('.info-window-line-1').text(place.name)
          $('.info-window-line-2').text(venueAddressLine1)
          $('.info-window-line-3').text(venueAddressLine2)
      }
    }
  })

  var input = document.getElementById('pac-input');
  var options = {
    componentRestrictions: {country: 'us'}
  }

  var autocomplete = new google.maps.places.Autocomplete(input, options);
  autocomplete.bindTo('bounds', map);

  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

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
    var reFormatAddress = place.formatted_address.slice(0, -5)
    var lat = place.geometry.location.lat().toString()
    var lng = place.geometry.location.lng().toString()
    // var zoneOffset = place.utc_offset / 0

    marker.setVisible(true);
    $('#venue_name').val(place.name)
    $('#venue_name').prop('readonly', true);
    $('#venue_address').val(reFormatAddress)
    $('#venue_address').prop('readonly', true);
    $('#venue_place').val(place.place_id)
    $('#venue_lat').val(lat)
    $('#venue_lng').val(lng)

    $("#venue-create-form-container").dialog('open');

    var venueAddressLine1 = place.address_components[0].short_name + ' ' + place.address_components[1].short_name
    var venueAddressLine2 = place.address_components[4].short_name + ', ' + place.address_components[6].short_name + ' ' + place.address_components[8].short_name

    infowindow.setContent(
      "<div><div class='info-window-line-1'>" + place.name + "</div><div class='info-window-line-2'>" + venueAddressLine1 + "</div><div class='info-window-line-3'>" + venueAddressLine2 + "</div><div class='info-window-line-4'><button class='button create-enue' type='button'>Select Venue!</button></div></div>"
    );
    infowindow.open(map, marker);
  });
}
