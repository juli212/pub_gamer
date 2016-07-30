function UpdateOctopusRating() {
	var idealWidth = 250;
	var rating = ($('#avg-rating-multiplier').attr('value')) / (0.05);
	var percentage = Math.round(rating * 100) / 10000; 
	var completeWidth = idealWidth * percentage ;
	$('#dimmed').width(idealWidth - completeWidth);
	$('#opaque').width(completeWidth);
}

$(document).ready(function() {
	UpdateOctopusRating();
});
