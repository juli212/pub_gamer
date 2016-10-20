$(window).load(function() {
	// $header = $('#page-header')
	$path = window.location.pathname
	// navbarColor = '#FFFFF0'
	// navbarHighlight = '#A893FF'
	// navbarUnderline = '#31AB3C'
	if ($path == "/" || $path == "") {
		$('#header-bottom').remove();
	}	else if ($path.includes("event")) {
		$('#search-form').attr("action", "/events/search");
		$('#events').css('text-decoration', 'underline');
		// $('#events').css('color', navbarColor);
		// $('#events').css('background-color', navbarHighlight);
		// $('#events').css('text-decoration', 'overline');
		// $header.text("Events");
	} else if ($path.includes("venue")) {
		// debugger;
		$('#search-form').attr("action", "/venues/search");
		// debugger;
		$('#venues').css('text-decoration', 'underline');
		// $('#venues').css('color', navbarColor);
		// $('#venues').css('background-color', navbarHighlight);
		// $header.text("Venues");
	} else if ($path.includes("user")){
		$('#topbar-row-three').remove()
		$('#user').css('text-decoration', 'underline');
		// $('#user').css('background-color', navbarHighlight);
		// $header.text("Profile");
	} else if ($path.includes("contact")){
		$('#topbar-row-three').remove()
		// $('#contact').css('color', navbarColor);
		$('#contact').css('text-decoration', 'underline');
		// $header.text("Contact");
	} else if ($path.includes("about")){
		$('#topbar-row-three').remove()
		$('#about').css('text-decoration', 'underline');
		// $('#about').css('background-color', navbarHighlight);
		// $header.text("About Us");
	}
});

// $(window).load(function() {
// 	if ($('.top-bar').height() > 0) {
//   	pad_height = $(".top-bar").height() + 25;
//   	$("#main").css("padding-top", pad_height);
// 	}
// });
