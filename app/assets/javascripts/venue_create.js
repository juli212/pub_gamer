$(document).ready(function() {
  var removeGames = function() {
    $('#venue-create-games').html("<p class='no-games-p'>No Games Added</p>")
  }

  $("#venue-create-form-container").dialog(dialogOptions, {
    open: function (event, ui) {
      $("body").css('overflow', 'hidden' )
    },
    width: setFormWidth,
    maxHeight: setFormHeight,
    close: function() {
      $('#venue-create-form')[0].reset();
      $('#venue-create-form').find("input[type=hidden][id^='venue_']")
      removeGames()
    },
  }).parent().draggable();

  $('.venue-create-game').on('click', function(event){
    clicked_div = event.target.closest('.venue-create-game')
    $(clicked_div).toggleClass('select-venue-game');
    $(clicked_div).find('input').prop('checked', !$(clicked_div).find('input').prop('checked'));
  })

  $('body').on('click', '.create-venue',function(event){
    event.preventDefault();
    var infoBox = $(this.parentElement.parentElement)
    var venueName = infoBox.find('.info-window-line-1').text()
    var venueAddress = infoBox.find('.info-window-line-2').text() + ", " + infoBox.find('.info-window-line-3').text()
    $('#venue_name').val(venueName)
    $('#venue_name').prop('readonly', true);
    $('#venue_address').val(venueAddress)
    $('#venue_address').prop('readonly', true);
    $("#venue-create-form-container").dialog('open');
  })
  
  $('#venue-create-form-container').on('click', '#add-new-game', function(event){
    event.preventDefault();
    $target = $('#other-text-field')
    $.ajax({
      url: "/games/add_game",
      type: "post",
      data: $target.serialize()
    }).done(function(response){
      $('#venue-create-games .no-games-p').remove()
      $('#venue-create-games').append(response)
      $('#other-text-field').val("")
    })
  })

  $('#venue-create-games').on('click', '.remove-game-button', function(event){
    event.preventDefault()
    $(this).closest('.update-game').remove()
    if ( $('#venue-create-games .update-game').length < 1 ) {
      removeGames()
    }
  })

});
