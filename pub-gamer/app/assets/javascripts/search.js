$(document).ready(function() {
	$( "#search-txt" ).autocomplete({
		minLength: 2,
		appendTo: "#search-results",
		source: function(request, response) {
  	  $.ajax({
        url: $('#search-form').attr("action"),
        dataType: "json",
        data: {
            term: request.term
        },
        success: function(data) {
	        response($.map(data, function(item) {
	          // console.log(data)
	          return {
	            label: item.name + item.address,
	            value: item.name,
	            id: item.id
	          };
	        }))
	    	}
			})   
	  },
	  // select: function(event, ui) {
	  	// $target = $(event.target)
	  	// debugger;
	  	// $('#venue-query').val(ui.item.value);
	  // },
	  focus: function(event, ui) {
	  	$('.ui-menu-item').css('background-color', "#FFFFF0");
	  	$('.ui-menu-item').css('color', "#2B2936");
	  	$('.ui-state-focus').css('background-color', "#827AA4");
	  	$('.ui-state-focus').css('color', "#EDD0AF");
    }
	})
  // $('#search-form').on('submit', function(event) {
  // 	event.preventDefault();
  //   $target = $(event.target)
  //   $.ajax({
  //     url: $target.attr('href'),
  //     data: $target.serialize()
  //   }).done(function(response){
  //   	// console.log(response);
  // 	debugger;
  //     $('.index-main').html(response);
  //   })
  // })
  $( "#event_location" ).autocomplete({
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
	          // console.log(data)
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
	  	// debugger;
	  	$.ajax({
  	    url: 'events/update_games',
    	  data: $('#event_venue_id').serialize()
    	}).done(function(response){
    		console.log(response);
    		$('#event-create-games').html(response);
      	// $('.index-main').html(response);
    	})
	  },
	  focus: function(event, ui) {
	  	$('.ui-menu-item').css('background-color', "#FFFFF0");
	  	$('.ui-menu-item').css('color', "#2B2936");
	  	$('.ui-state-focus').css('background-color', "#827AA4");
	  	$('.ui-state-focus').css('color', "#EDD0AF");
    }
	})




	$( "#other-text-field" ).autocomplete({
		minLength: 1,
		appendTo: "#add-venue-game-results",
		source: function(request, response) {
  	  $.ajax({
        url: "/venues/add_games",
        dataType: "json",
        data: {
            term: request.term
        },
        success: function(data) {
	        response($.map(data, function(item) {
	          // console.log(data)
	          return {
	            label: item.name,
	            value: item.name,
	            id: item.id
	          };
	        }))
	    	}
			})   
	  },
	  select: function(event, ui) {
	  	$target = $(event.target)
	  	// $('#event_address').val(ui.item.address);
	  	// $('#event-venue_id').html("<input type='hidden' id='event_venue_id' name='event[venue_id]'>");
	  	// $('#event_venue_id').val(ui.item.id);
	  	// debugger;
	  	// $.ajax({
  	 //    url: 'events/update_games',
    // 	  data: $('#event_venue_id').serialize()
    // 	}).done(function(response){
    // 		console.log(response);
    // 		$('#event-create-games').html(response);
    // 	})
	  },
	  focus: function(event, ui) {
	  	$('.ui-menu-item').css('background-color', "#FFFFF0");
	  	$('.ui-menu-item').css('color', "#2B2936");
	  	$('.ui-state-focus').css('background-color', "#827AA4");
	  	$('.ui-state-focus').css('color', "#EDD0AF");
    }
	})
});
