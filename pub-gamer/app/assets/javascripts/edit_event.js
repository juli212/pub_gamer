$(document).ready(function() {
	function emptyEventForm() {
		$('#edit-event-box').html("");
	}
	function setEventForm() {
		$('.game-button').prop('checked', true)
		$('.game-button').parent().addClass('select-game')
		$('#event-create-button-div').replaceWith(updateEventButton)
	}
	var updateEventButton = "<div id='event-edit-button-div'>" 
		+ "<button class='button'>Update</button>"
		+ "</div"

	$('#edit-event-box').dialog({
		modal: true,
		autoOpen: false,
    minHeight: screen.height * 0.8,
    minWidth: $(window).width() * 0.7,
    position: ({ my:"center top", at: "center middle", of: ".top-bar"}),
		close: emptyEventForm
	})
	$('.edit-event').on('click', function(event){
		event.preventDefault();
		event.stopPropagation();
		// debugger;
		$('#edit-event-box').dialog('open')
		$.ajax({
			url: $(this).parent().attr('action')
		}).done(function(response){
			$('#edit-event-box').html(response);
			setEventForm();
		})
	})
	$('#edit-event-box').on('click', '.event-game', function(event){
		clicked_div = event.target.closest('.event-game')
    $(clicked_div).toggleClass('select-game');
    if ( $(clicked_div).hasClass('select-game') ) {
      $(clicked_div).find('input').prop('checked', true)
    }
    else {
      $(clicked_div).find('input').prop('checked', false)
    }
	})

	$('.delete-event').on('click', function(event){
		var deleteEvent = confirm("Are you sure you want to delete this event?");
		if (deleteEvent == false) {
			event.preventDefault();
		}
	})
});