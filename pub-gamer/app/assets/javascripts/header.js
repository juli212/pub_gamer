$(document).ready(function() {
	$header = $('#page-header')
	$path = window.location.pathname
	if ($path == "/" ) {
		$('.header-row').remove();
	}	else if ($path.includes("event")) {
		$header.text("Events");
		$('#search-form').attr("action", "/events/search");
	} else if ($path.includes("venue")) {
		$header.text("Venues");
		$('#search-form').attr("action", "/venues/search");
	} else if ($path.includes("user")){
		$header.text("Profile");
	}
});

