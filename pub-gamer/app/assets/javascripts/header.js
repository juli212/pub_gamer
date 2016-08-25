$(document).ready(function() {
	$header = $('#page-header')
	if (window.location.pathname.includes("event")) {
		$header.text("Events");
	} else if (window.location.pathname.includes("venue")) {
		$header.text("Venues");
	} else if (window.location.pathname.includes("user")){
		$header.text("Profile");
	}
});