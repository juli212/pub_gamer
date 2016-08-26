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
	            label: item.name,
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
	  	$('.ui-menu-item').css('background-color', "white");
	  	$('.ui-menu-item').css('color', "green");
	  	$('.ui-state-focus').css('background-color', "green");
	  	$('.ui-state-focus').css('color', "white");
    }
	})
  $('#search-form').on('submit', function(event) {
  	event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr('href'),
      data: $target.serialize()
    }).done(function(response){
    	// console.log(response);
      $('.index-main').html(response);
    })
  })
});
