$(document).ready(function() {

  var openEventForm = function() {
    resetEventForm();
    stopScroll();
    if (window.location.pathname.includes("venue") ) {
      barName = $('#venue-name').text().substring(2)
      barAddress = $('#get-venue-address').text()
      $('#event_location').val(barName);
      $('#event_location').prop('readonly', true);
      $('#event_address').val(barAddress);
      $('#event_address').prop('readonly', true);
    }
  }

  var resetEventForm = function() {
    $formBox = $('#event-create-form')[0].reset()
    $('.select-game').removeClass('select-game');
  }
  
  $("#event-create-container").dialog(dialogOptions, {
    open: openEventForm,
    close: resetEventForm
  }).parent().draggable();

  $('#event-create-container, #edit-event-box').on('click', '#add-new-game', function(event){
    event.preventDefault();
    $target = $(this).closest('#event-add-game').find('#new-game-field')
    $.ajax({
      url: "/games/add_game",
      method: "post",
      data: $target.serialize()
    }).done(function(response){
      $('#event-create-games').append(response)
      $('#new-game-field').val("")
    })
  })

  $('#event-create-container, #edit-event-box').on('click', '.remove-game-button', function(event){
    event.preventDefault(); 
    $(this).closest('.update-game').remove()
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
    if ( $('#event-create-games').find('.update-game').length <= 0 ) {
      noGames()
    }
  })
});
