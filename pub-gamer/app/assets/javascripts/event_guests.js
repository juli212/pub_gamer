$(document).ready(function() {
	$('.event-status').on('click','form', function(event){
		event.preventDefault();
		debugger;
		$target = $(this)
		var action = this.action
		if ( $target.children('join-leave-event') ) {
			$('.index-bottom-notice p').text("");
			$.ajax({
				url: action,
				type: "put",
				data: $target.serialize()
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