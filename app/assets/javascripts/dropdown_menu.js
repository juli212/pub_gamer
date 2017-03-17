$(document).ready(function() {
	var $page = $(document)
	$page.on('click', function(event){
		var $clicked = $(event.target)
		if ($clicked.parents('ul.has-dropdown').length < 1 ){
			$('.has-dropdown ul').hide();
		}
	})

	$('.dropdown-arrow').on('click', function(event){
		event.preventDefault();
		$(this).closest('li').find('ul').toggle()
	})

	
// venue_show dropdown highlighting header
	$venueDropdown = $('#venue-show-dropdown')
	$('#venue-name').on('click', function(){
		if ($venueDropdown.css('display') != 'none'){
			$(this).addClass('purple-background')
		} else {
			$(this).removeClass('purple-background')
		}
	})
});