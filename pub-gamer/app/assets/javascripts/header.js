$(window).load(function() {
	$path = window.location.pathname
	if ($path == "/" || $path == "") {
		$('#header-bottom').remove();
	}	else if ($path.includes("event")) {
		$('#search-form').attr("action", "/events/search");
		$('#events').css('text-decoration', 'underline');
	} else if ($path.includes("venue")) {
		$('#search-form').attr("action", "/venues/search");
		$('#venues').css('text-decoration', 'underline');
	} else if ($path.includes("user")){
		$('#topbar-row-three').remove()
		$('#user').css('text-decoration', 'underline');
	} else if ($path.includes("contact")){
		$('#topbar-row-three').remove()
		$('#contact').css('text-decoration', 'underline');
	} else if ($path.includes("about")){
		$('#topbar-row-three').remove()
		$('#about').css('text-decoration', 'underline');
	}
	$('.top-bar img').mouseover(function(event){
		$('.top-bar img').attr('src', '/assets/header2GlassesOff.png')
	})
	$('.top-bar img').mouseout(function(event){
		$('.top-bar img').attr('src', '/assets/header2.png')
	})
});

