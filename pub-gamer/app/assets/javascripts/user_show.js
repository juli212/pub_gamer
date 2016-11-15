
$(window).on("load resize",function(event){
	var boxWidth = ($($('.user-event')[0]).width() + 40)
	var innerEventWidth = $('#user-events .user-event').length * boxWidth
	var innerFavoriteWidth = $('#user-favorites .user-event').length * boxWidth
	$('#user-events .inside-user-scroll').css('width', innerEventWidth)
	$('#user-favorites .inside-user-scroll').css('width', innerFavoriteWidth)

	if ($(window).width() < 640) {
  	var outerScrollWidth = $(window).width() - 30
	} else {
		var outerScrollWidth = $(window).width() * 0.8
	}
	$('.outside-user-scroll').css('width', outerScrollWidth)

	$('#user').on('click', function(event){
		event.preventDefault();
	})

	$('.user-button-row a').on('click', function(event){
		event.preventDefault();
		$.ajax({
			url: this.href
		}).done(function(response){
			$('#user-events .inside-user-scroll').replaceWith(response)
			var newWidth = $('#user-events .user-event').length * boxWidth
			$('#user-events .inside-user-scroll').css('width', newWidth)
		})	
	})
	$('#venue-show-dropdown-arrow').on('click', function(event){
		event.preventDefault();
		$('#venue-show-dropdown').toggle();
	})
});
