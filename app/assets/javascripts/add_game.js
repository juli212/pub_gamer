$(document).ready(function() {
	var toggleVisibility = function() {		
		$('#add-game-link, #add-games, #cancel-add-game-link').toggle()
	}

	$('#add-game-link').on('click', function(event){
		event.preventDefault();
		toggleVisibility()
	})

	$('#add-game-button').on('click', function(event){
		event.preventDefault();
		$gameForm = $('#add-games')
		$.ajax({
			url: "/venues/add_games",
			data: $gameForm.serialize()
		}).done(function(response){
			$('#add-games')[0].reset();
			$('#add-game-link').before(response)
			toggleVisibility()
		})
	})

	$('#cancel-add-game-link').on('click', function(event){
		event.preventDefault();
		toggleVisibility();
		$('#add-games')[0].reset();
	})
})