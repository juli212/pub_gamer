$(document).ready(function() {
	$header = $('#page-header')
	$path = window.location.pathname
	if ($path == "/" || $path == "") {
		$('#header-row').remove();
	}	else if ($path.includes("event")) {
		$('#events').css('color','#EDD0AF');
		$('#events').css('background-color', '#635A8E');
		// $header.text("Events");
		$('#search-form').attr("action", "/events/search");
	} else if ($path.includes("venue")) {
		$('#venues').css('color','#EDD0AF');
		$('#venues').css('background-color', '#635A8E');
		// $header.text("Venues");
		$('#search-form').attr("action", "/venues/search");
	} else if ($path.includes("user")){
		$('#user').css('color','#EDD0AF');
		$('#user').css('background-color', '#635A8E');
		// $header.text("Profile");
	} else if ($path.includes("contact")){
		$('#contact').css('color','#EDD0AF');
		$('#contact').css('background-color', '#635A8E');
		// $header.text("Contact");
	} else if ($path.includes("about")){
		$('#about').css('color','#EDD0AF');
		$('#about').css('background-color', '#635A8E');
		// $header.text("About Us");
	}
});

$(window).load(function() {
  pad_height = $(".top-bar").height() + 15;
  $("#main").css("padding-top", pad_height);
});
