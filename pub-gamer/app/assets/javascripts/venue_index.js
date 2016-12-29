$(document).ready(function() {
	var mapNotVisible = true
	$('.view-box').first().toggle()
	$('#toggle-venue-view-links a').first().css('text-decoration', 'none').addClass('selected-view')
	$('#toggle-venue-view-links').on('click', 'a', function(event){
		event.preventDefault();
		var mapStatus = mapNotVisible
		mapNotVisible = toggleViewVisibility(this, mapNotVisible)
		if ( $(this).is('#map') && mapStatus ){
			allVenuesMap(venuesFound)
		}
	})
})

function toggleViewVisibility(link, visibility) {
	if (!$(link).hasClass('selected-view')) {
		$('.view-box').toggle()
		$('.selected-view').css('text-decoration', 'underline').removeClass('selected-view')
		$(link).addClass('selected-view')
		$(link).css('text-decoration', 'none')
		return !visibility
	} else {
		return visibility
	}
}
