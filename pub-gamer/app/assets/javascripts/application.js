//= require jquery
//= require jquery_ujs  
//= require jquery-ui
//= require foundation
//= require_tree .

$(document).ready(function() {

  $('#login a').on('click', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr('href')
    }).done(function(response){
        $('#form-container').html(response).hide().fadeIn(300);
    })
  })

  $('#register a').on('click', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr('href')
    }).done(function(response){
        $('#form-container').html(response).hide().fadeIn(300);
    })
  })

  $('body').on('click', '#createVenue',function(event){
    event.preventDefault();
    $venueName = $(document.getElementsByClassName("title full-width")).first().html()
    $venueStreet = $(document.getElementsByClassName("address-line full-width")).first().html()
    $venueCity = $(document.getElementsByClassName("address-line full-width")).last().html()
    document.getElementById('venue_name').value = $venueName;
    document.getElementById('venue_address').value = $venueStreet + ", " + $venueCity;
      $('#venue-create-form').hide().fadeIn(300)

  })

  $authToken = $('meta[name="csrf-token"]').attr('content')

  function checkDOMChange() {
    setTimeout( checkDOMChange, 100 );
    $targetDiv = $("div").filter(function() {
      return $(this).css('left') == "1px" && $(this).css('top') == "1px" && $(this).css('width') == '231px';
      });
    if (document.getElementById("createVenue") == null)
        // debugger;
      { $("div").filter(function() {
            $venueAddress = $(document.getElementsByClassName("address-line full-width")).first().html()
        return $(this).css('left') == "1px" && $(this).css('top') == "1px" && $(this).css('width') == '231px';
        }).append("<button id=createVenue type=button>Select Venue!</button>");
      }
    else {
        // do nothing
      }
  }
  checkDOMChange();
});

 function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 40.7118739, lng: -74.002533},
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });


      }
$(function(){ $(document).foundation(); });
