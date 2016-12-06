$(document).ready(function() {
  // $('#event-create-games').on('click', '.event-game', function(event){
  //   clicked_div = event.target.closest('.event-game')
  //   $(clicked_div).toggleClass('select-game');
  //   if ( $(clicked_div).hasClass('select-game') ) {
  //     $(clicked_div).find('input').prop('checked', true)
  //   }
  //   else {
  //     $(clicked_div).find('input').prop('checked', false)
  //   }
  // })

  var openEventForm = function() {
    resetEventForm();
    if (window.location.pathname.includes("venue") ) {
      barName = $('#venue-name').text()
      barAddress = $('#get-venue-address').text()
      $('#event_location').val(barName);
      $('#event_location').prop('readonly', true);
      $('#event_address').val(barAddress);
      $('#event_address').prop('readonly', true);
    }
  }

  var resetEventForm = function() {
    $('#event-create-form')[0].reset();
    $('.select-game').removeClass('select-game');
  }
  $("#event-create-container").dialog({
    modal: true,
    autoOpen: false,
    open: openEventForm,
    title: "Create Event!",
    height: setHeight(),
    width: setFormWidth(),
    position: ({ my:"center middle", at: "center middle", of: window }),
    close: resetEventForm
  });

  $('#event-create-container, #edit-event-box').on('click', '#add-new-game', function(event){
    // debugger;
    event.preventDefault();
    $target = $(this).closest('#event-add-game').find('#new-game-field')
    $.ajax({
      url: "/events/add_games",
      data: $target.serialize()
    }).done(function(response){
      $('#event-create-games').append(response)
      $('#new-game-field').val("")
    })
  })

  $('#event-create-container, #edit-event-box').on('click', '.remove-event-game-button', function(event){
    event.preventDefault(); 
    $(this).closest('.event-game').remove()
  })

  $('#venue-event-create-link, #event-create-link').on('click', function(event){
    event.preventDefault();
    $("#event-create-container").dialog('open');
  })

  var noGames = function() {
    var go = confirm("You have not added any games. Do you want to continue without adding any?");
    if (go == false) {
      event.preventDefault();
    }
  }

  $('#event-create-form').on('submit', function(event){
    if ( $('#event-create-games').find('.event-game').length <= 0 ) {
      noGames()
    }
  })
});
