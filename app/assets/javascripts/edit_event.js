$(document).ready(function() {

	var updateEventButton = "<div id='event-edit-button-div' class='small-12 columns'>" 
		+ "<button class='button'>Update</button>"
		+ "</div"

	$('#edit-event-box').dialog(dialogOptions, {
		close: emptyDialogBox
	}).parent().draggable();
	$('.edit-event').on('click', function(event){
		event.preventDefault();
		event.stopPropagation();
		$('#edit-event-box').dialog('open')
		$.ajax({
			url: this.closest('form').action
		}).done(function(response){
			$('#edit-event-box').html(response);

		// add autocomplete to change venue(options in search.js):
			$('#event_location').autocomplete(eventVenueACOpctions)

		// add autocomplete to add games(options in search.js:
			$("#new-game-field").autocomplete(eventGameOptions)
			// end autocomplete
		})
	})

	$('.delete-event').on('click', function(event){
		event.preventDefault();
		event.stopPropagation();
		var deleteEvent = confirm("Are you sure you want to delete this event?");
		if (deleteEvent != false) {
			$target = $(this).parent()
			$.ajax({
				url: $target.attr('action'),
				method: $target.attr('method'),
				data: $target.serialize()
			}).done(function(){
				$target.closest('.index-box').addClass('deleted-event');
				$target.closest('.event-status').empty();
				$('.show-box').addClass('deleted-event');
				$('#comment_body, #comment-button').attr('disabled', true);
				$('#event-show-comments, #comment_body, .event-show-side').addClass('cancel-fade');
			})
		}
	})
});