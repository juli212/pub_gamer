$(document).ready(function() {
  $('#event-create-games').on('click', '.event-game', function(event){
    // debugger;
    clicked_div = event.target.closest('.event-game')
    $(clicked_div).toggleClass('select-game');
    if ( $(clicked_div).hasClass('select-game') ) {
      $(clicked_div).find('input').prop('checked', true)
    }
    else {
      $(clicked_div).find('input').prop('checked', false)
    }
    // $(clicked_div).find('input').prop('checked', !$(clicked_div).find('input').prop('checked'));
  })

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
    // minHeight: 500,
    // width: 500,
    minHeight: screen.height * 0.8,
    minWidth: $(window).width() * 0.7,
    position: ({ my:"center top", at: "center middle", of: ".top-bar"}),
    show: {
        effect: "blind",
        duration: 1000
    },
    hide: {
        effect: "explode",
        duration: 1000
    },
    close: resetEventForm
  });

  // $('#event-create-link').on('click', function(event){
  //   event.preventDefault();
  //   $("#event-create-container").dialog('open');
  // })
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
    if ( $('#event-create-games').find('.select-game').length <= 0 ) {
      noGames()
    }
  })
});
