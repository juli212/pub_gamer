//= require jquery
//= require jquery_ujs  
//= require jquery-ui
//= require jquery.modal
//= require foundation
//= require_tree .

$(function(){ 
  $(document).foundation();
});

// $(document).ready(function() {
//   $('body').on('click', '#createVenue',function(event){
//     event.preventDefault();
//     var venueName = $(this.parentElement).find('.title').text()
//     var venueAddress = $('.address-line').first().text() + " " + $('.address-line').last().text()
//     $('#venue_name').val(venueName)
//     $('#venue_name').prop('readonly', true);
//     $('#venue_address').val(venueAddress)
//     $('#venue_address').prop('readonly', true);
//     $("#venue-create-form-container").dialog('open');
//   })
// });
    // debugger;
    // document.getElementById('venue_name').value = place.name;
    // $('#venue_name').prop('readonly', true);
    // document.getElementById('venue_address').value = place.formatted_address;
    // $('#venue_address').prop('readonly', true);
    // document.getElementById('venue_neighborhood').value = place.address_components[2].long_name;
    // document.getElementById('venue_place').value = place.place_id;

    // $venueName = $(document.getElementsByClassName("title full-width")).first().html()
    // $venueStreet = $(document.getElementsByClassName("address-line full-width")).first().html()
    // $venueCity = $(document.getElementsByClassName("address-line full-width")).last().html()
    // document.getElementById('venue_name').value = $venueName;
    // document.getElementById('venue_address').value = $venueStreet + ", " + $venueCity;



// $(document).ready(function() {
//   $('body').on('click', '#createVenue',function(event){
//     event.preventDefault();
//     // debugger;
//     $venueName = $(document.getElementsByClassName("title full-width")).first().html()
//     $venueStreet = $(document.getElementsByClassName("address-line full-width")).first().html()
//     $venueCity = $(document.getElementsByClassName("address-line full-width")).last().html()
//     document.getElementById('venue_name').value = $venueName;
//     document.getElementById('venue_address').value = $venueStreet + ", " + $venueCity;
//       $('#venue-create-form').hide().fadeIn(300)
//   })
// });

//   $authToken = $('meta[name="csrf-token"]').attr('content')
//   function checkDOMChange() {
//     setTimeout( checkDOMChange, 100 );
//     // debugger;
//     $targetDiv = $("div").filter(function() {
//       return $(this).css('left') == "1px" && $(this).css('top') == "1px" && $(this).css('width') == '231px';
//     });
//     if (document.getElementById("createVenue") == null) { 
//       $("div").filter(function() {
//         $venueAddress = $(document.getElementsByClassName("address-line full-width")).first().html()
//         return $(this).css('left') == "1px" && $(this).css('top') == "1px" && $(this).css('width') == '231px';
//       }).append("<button id=createVenue type=button>Select Venue!</button>");
//     }
//     else {
//     }
//   }
//   checkDOMChange();

