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
  
  $('#venue-create-form-container').on('click', '#add-new-game', function(event){
    event.preventDefault();
    // debugger;
    $target = $('#other-text-field')
    $.ajax({
      url: "/games/add_game",
      type: "post",
      data: $target.serialize()
    }).done(function(response){
      $('#venue-create-games').append(response)
      $('#other-text-field').val("")
    })
  })

  $('#venue-create-games').on('click', '.remove-game-button', function(event){
    $(this).closest('.update-game').remove()
  })

  var resetVenueForm = function() {
    $('#venue-create-form')[0].reset()
    $('#venue_place').val("")
    $('#pac-input').val("")
    $('.select-venue-game').removeClass('select-venue-game')
    $('#venue-create-games').html("")
  }

  $("#venue-create-form-container").dialog(dialogOptions, {
    close: resetVenueForm
  })
});