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
	} else if ($path.includes("user")){
		$('#topbar-row-three').remove()
		$('#user').addClass('header-underline')
	} else if ($path.includes("contact")){
		$('#topbar-row-three').remove()
		$('#contact').addClass('header-underline')
	} else if ($path.includes("about")){
		$('#topbar-row-three').remove()
		$('#about').addClass('header-underline')
	}
	$('.top-bar img').mouseover(function(event){
		$('.top-bar img').attr('src', '/assets/header2GlassesOff.png')
	})
	$('.top-bar img').mouseout(function(event){
		$('.top-bar img').attr('src', '/assets/header2.png')
	})
	// $('#toggle-venue-view-links').on('click', '#map-view-link', function(){
	// 	$('#search-form').attr("action", "/venues/map_search")
	// })
	// 	$('#toggle-venue-view-links').on('click', '#list-view-link', function(){
	// 	$('#search-form').attr("action", "/venues/search")
	// })
});

