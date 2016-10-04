function IndexOctopusRating() {
	$('.venue-index-avg-rating').each(function() {
		var idealWidth = 200;
		var rating = $(this).attr('value') / (0.05);
		var percentage = Math.round(rating * 100) / 10000; 
		var completeWidth = idealWidth * percentage ;
		$(this).children('.dimmed').width(idealWidth - completeWidth);
		$(this).children('.opaque').width(completeWidth);
	})
}

