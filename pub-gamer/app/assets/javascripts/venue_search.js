$(document).ready(function() {
	$( "#venues-search-txt" ).autocomplete({
		minLength: 2,
		appendTo: "#venues-search-results",
		source: function(request, response) {
  	  $.ajax({
        url: "/venues/search",
        dataType: "json",
        data: {
            term: request.term
        },
        success: function(data) {
	        response($.map(data, function(item) {
	          console.log(data)
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
	  	$('#venue-query').val(ui.item.value);
	  },
	  focus: function(event, ui) {
	  	$('.ui-menu-item').css('background-color', "white");
	  	$('.ui-menu-item').css('color', "green");
	  	$('.ui-state-focus').css('background-color', "green");
	  	$('.ui-state-focus').css('color', "white");
    }
	})
	// $('ul.ui-autocomplete').removeAttr('style');
	// $('.ui-menu-item').css("background-color", "yellow");
	// $("#venues-search-results ul li").hover(function(event){
	// 	// debugger;
	// 	hovered_div = event.target
	// 	$(hovered_div).css("background-color","yellow");
	// })

	// $("#venue-search-button").on('click', function(event) {
		// event.preventDefault();
		// alert('click!');
	// })
});
