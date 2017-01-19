var eventGameOptions = {
	minLength: 1,
	appendTo: "#add-event-game-results",
	source: function(request, response){
		$.ajax({
			url: "/games/add_game",
			type: "post",
			dataType: "json",
			data: {
				term: request.term
			},
			success: function(data){
				response($.map(data, function(item) {
					return {
						label: item.name,
						value: item.name,
						id: item.id
					};
				}))
			}
		})
	}
}

var eventVenueACOpctions = {
	minLength: 2,
	appendTo: "#event-venue-results",
	source: function(request, response) {
	  $.ajax({
      url: "/events/add_venue",
      dataType: "json",
      data: {
          term: request.term
      },
      success: function(data) {
        response($.map(data, function(item) {
          return {
            label: item.name,
            value: item.name,
            address: item.address,
            id: item.id
          };
        }))
    	}
		})   
  },
  select: function(event, ui) {
  	$target = $(event.target)
  	$('#event_address').val(ui.item.address);
  	$('#event-venue_id').html("<input type='hidden' id='event_venue_id' name='event[venue_id]'>");
  	$('#event_venue_id').val(ui.item.id);
  	$.ajax({
	    url: '/events/update_games',
  	  data: $('#event_venue_id').serialize()
  	}).done(function(response){
   		$('#event-create-games').html(response);
   	})
  }
}

$(document).ready(function() {

	// general search
	$( "#search-txt" ).autocomplete({
		minLength: 2,
		appendTo: "#search-results",
		source: function(request, response) {
        var path = '/' + $('#search-form').attr('name') + '/dropdown'
  	  $.ajax({
  	  	url: path,
        dataType: "json",
        data: {
            term: request.term
        },
        success: function(data) {
	        response($.map(data, function(item) {
	          return {
	            label: item.name + item.address,
	            value: item.name,
	            id: item.id
	          };
	        }))
	    	}
			})   
	  }
	})

// add venue to new event
  $('#event-create-container #event_location').autocomplete(eventVenueACOpctions)

// add neighborhood to venue
  $('#venue_neighborhood').autocomplete({
  	minLength: 1,
  	appendTo: "#add-venue-neighborhood-results",
  	source: function(request, response){
  		$.ajax({
        url: "/venues/add_neighborhood",
        dataType: "json",
        data: {
            term: request.term
        },
        success: function(data) {
	        response($.map(data, function(item) {
	          return {
	            label: item.name,
	            value: item.name,
	            id: item.id
	          };
	        }))
	    	}
			})
  	}
  })

// add game to event
	$("#new-game-field").autocomplete(eventGameOptions)

// add game to venue
	$( "#other-text-field, #add-game-input" ).autocomplete({
		minLength: 1,
		appendTo: "#add-venue-game-results",
		source: function(request, response) {
  	  $.ajax({
  	  	url: "/games/add_game",
  	  	type: "post",
        dataType: "json",
        data: {
            term: request.term
        },
        success: function(data) {
	        response($.map(data, function(item) {
	          return {
	            label: item.name,
	            value: item.name,
	            id: item.id
	          };
	        }))
	    	}
			})   
	  }
	})
});