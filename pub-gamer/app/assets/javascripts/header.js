$(window).load(function() {
	$path = window.location.pathname
	if ($path == "/" || $path == "") {
		$('#header-bottom').remove();
	}	else if ($path.includes("event")) {
		$('#search-form').attr("action", "/events/search").attr('name', 'events');
		$('#events').addClass('header-underline')
	} else if ($path.includes("venue")) {
		$('#search-form').attr("action", "/venues/search").attr('name', 'venues');
		$('#venues').addClass('header-underline')
	} else if ($path.includes("profile")){
		$('#topbar-row-three').remove()
		$('#user').addClass('header-underline')
	} else if ($path.includes("contact")){
		$('#topbar-row-three').remove()
		$('#contact').addClass('header-underline')
	} else if ($path.includes("about")){
		$('#topbar-row-three').remove()
		$('#about').addClass('header-underline')
	}
	$('#header-images').mouseover(function(event){
		$('#octopus-head-image a').toggle()
	})
	$('#header-images').mouseout(function(event){
		$('#octopus-head-image a').toggle()
	})
});

