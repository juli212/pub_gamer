//= require jquery
//= require jquery_ujs  
//= require jquery-ui
//= require jquery.modal
//= require foundation
//= require_tree .

$(document).ready(function() {
  $('body').on('click', '#createVenue',function(event){
    event.preventDefault();
    debugger;
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
    if (document.getElementById("createVenue") == null) { 
      $("div").filter(function() {
        $venueAddress = $(document.getElementsByClassName("address-line full-width")).first().html()
        return $(this).css('left') == "1px" && $(this).css('top') == "1px" && $(this).css('width') == '231px';
      }).append("<button id=createVenue type=button>Select Venue!</button>");
    }
    else {
    }
  }
  checkDOMChange();
});

$(function(){ 
  $(document).foundation();
});
