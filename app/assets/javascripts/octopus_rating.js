$(document).ready(function() {
	updateOctopusRating();
});

function IndexOctopusRating() {
	$('.venue-index-avg-rating').each(function() {
		var width = 200;
		var rating = $(this).attr('value') / (0.05);
		var dimmed = $(this).children('.dimmed')
		var opaque = $(this).children('.opaque')
		octopusRating(width, rating, opaque, dimmed);
	})
}

function updateOctopusRating() {
	var width = 250;
	var rating = ($('#octopus-avg-rating').attr('value')) / (0.05);
	var opaque = $('#opaque')
	var dimmed = $('#dimmed')
	octopusRating(width, rating, opaque, dimmed);
}

function octopusRating(totalWidth, rating, opaqueElement, dimmedElement) {
	var percent = Math.round(rating * 100) / 10000;
	var opaqueWidth = totalWidth * percent;
	dimmedElement.width(totalWidth - opaqueWidth);
	opaqueElement.width(opaqueWidth);
}