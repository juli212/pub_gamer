$(document).ready(function() {
	$header = $('#page-header')
	if (window.location.pathname.includes("event")) {
		$header.text("Events");
		$('#search-form').attr("action", "/events/search");
	} else if (window.location.pathname.includes("venue")) {
		$header.text("Venues");
		$('#search-form').attr("action", "/venues/search");
	} else if (window.location.pathname.includes("user")){
		$header.text("Profile");
	}
		else if (window.location.pathname == "/" ) {
		$('.header-row').remove();
	}
});

// div id: header-search-container (SAME)
// 	form id: venues-search-form = search-form
// 		div class: venues-search = search
// 			input id: venues-search-txt = search-txt
// 			input class: venue-index-head = index-head

// 			div class: results (SAME)
// 			div id: venues-search-results = search-results

// 		div
// 			submit tag class: button, venue-index-head = index-head
// 			submit tag id: venue-search-button = search-button
// 			submit tag action: /venues = blank (to append w. js)



// div id: header-search-container
// 	form 
// 		input id: event-index-search = search-txt

// 		submit tag class: button
// 		submit tag id: event-search-button = search-button


// 	form id: search-form
// 		div class: search
// 			input id: search-txt
// 			input class: index-head

// 			div class: results (SAME)
// 			div id: search-results

// 		div
// 			submit tag class: button, index-head
// 			submit tag id: search-button
// 			submit tag action: blank...
