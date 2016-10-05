$(document).ready(function() {
  $('.venue-create-game').on('click', function(event){
    clicked_div = event.target.closest('.venue-create-game')
    $(clicked_div).toggleClass('select-venue-game');
    $(clicked_div).find('input').prop('checked', !$(clicked_div).find('input').prop('checked'));
  })

  $('body').on('click', '#createVenue',function(event){
    event.preventDefault();
    var infoBox = $(this.parentElement.parentElement)
    // debugger;
    var venueName = infoBox.find('.info-window-line-1').text()
    // var venueAddress = $('.address-line').first().text() + ", " + $('.address-line').last().text()
    var venueAddress = infoBox.find('.info-window-line-2').text() + ", " + infoBox.find('.info-window-line-3').text()
    $('#venue_name').val(venueName)
    $('#venue_name').prop('readonly', true);
    $('#venue_address').val(venueAddress)
    $('#venue_address').prop('readonly', true);
    $("#venue-create-form-container").dialog('open');
  })
  
  $('#add-new-game').on('click', function(event){
    // alert('click')
    event.preventDefault();
    $target = $('#other-text-field')
    $.ajax({
      url: "/venues/add_games",
      // method: "post",
      data: $target.serialize()
    }).done(function(response){
      // console.log(response)
    // debugger;
      $('#venue-create-games').append(response)
      $('#other-text-field').val("")
    })
  })

  $('#venue-create-games').on('click', '.remove-venue-game-button', function(event){
    $(this).closest('.venue-create-game').remove()
  })

  var resetForm = function() {
    $('#venue-create-form')[0].reset()
    $('#venue_place').val("")
    $('#pac-input').val("")
    $('.select-venue-game').removeClass('select-venue-game')
    $('#venue-create-games').html("")
  }

  $("#venue-create-form-container").dialog({
    modal: true,
    autoOpen: false,
    minHeight: 250,
    width: 650,
    position: ({ my:"center", at: "center", of: "#map-wrapper"}),
    show: {
        effect: "blind",
        duration: 1000
    },
    hide: {
        effect: "explode",
        duration: 1000
    },
    close: resetForm
  });
});

  // $('#event-create-link').on('click', function(event){
    // event.preventDefault()
    // if (window.location.pathname.includes("venue") ) {
    //   barName = $('#venue-name').text()
    //   barAddress = $('#venue-address').text()
    //   $('#event_location').val(barName);
    //   $('#event_location').prop('readonly', true);
    //   $('#event_address').val(barAddress);
    //   $('#event_address').prop('readonly', true);
    // }
    // $("#venue-create-form-container").dialog('open');
  // })
