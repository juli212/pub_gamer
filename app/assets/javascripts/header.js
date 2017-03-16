$(window).load(function() {
	$path = window.location.pathname
	$background = $('#header-bottom')
	$searchBar = $('#search-form input')
	$searchInput = $('#search-txt')
	if ($path == "/" || $path == "") {
		disableSearch()
	}	else if ($path.includes("event")) {
		$('#search-form').attr("action", "/events/search").attr('name', 'events');
		$('#events').addClass('header-underline')
	} else if ($path.includes("venue")) {
		$('#search-form').attr("action", "/venues/search").attr('name', 'venues');
		$('#venues').addClass('header-underline')
	} else if ($path.includes("profile") || $path.includes("user")){
		disableSearch()
		$('#user').addClass('header-underline')
	} else if ($path.includes("contact")){
		disableSearch()
		$('#contact').addClass('header-underline')
	} else if ($path.includes("about")){
		disableSearch()
		$('#about').addClass('header-underline')
	}
	$('#header-images').mouseover(function(event){
		$('#octopus-head-image a').toggle()
	})
	$('#header-images').mouseout(function(event){
		$('#octopus-head-image a').toggle()
	})

	function disableSearch() {
		$background.css('background-color', 'rgba(251, 235, 212, 0.3)')
		$searchInput.css('opacity', '0.25')
		$searchBar.prop('disabled', 'true')
	}

});
