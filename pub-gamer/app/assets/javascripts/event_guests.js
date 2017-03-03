$(document).ready(function() {
	$('.event-status').on('click','form', function(event){
		event.preventDefault();
		$target = $(this)
		var action = this.action
		var serializedData
			if ( window.location.pathname == "/events" ){
				serializedData = $target.serialize() + '&partial=guest_index'
			} else {
				serializedData = $target.serialize() + '&partial=guest_show'
			}
		// }
		// debugger;
		if ( $target.children('join-leave-event') ) {
			$('.index-bottom-notice p').text("");
			$.ajax({
				url: action,
				type: "put",
				data: serializedData
				// data: $target.serialize()
			}).done()
		} else {
			$.ajax({
				url: action
			}).done()
			$target.closest('.index-box').addClass('deleted-event');
			$target.closest('.index-box').find('.event-status').empty();
		}
	})
})