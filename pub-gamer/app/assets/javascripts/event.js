$(document).ready(function() {
	$('#new_comment').on('submit', function(event){
		event.preventDefault()
		var target = event.target
		$.ajax({
			url: target.action,
			type: target.method,
			data: $(target).serialize()
		}).done(function(response){
			$('#event-show-comments').append(response)
		})
		target.reset()
	})
});