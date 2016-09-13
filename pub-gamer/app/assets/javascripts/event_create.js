// $(document).ready(function() {
//   $('#event-create-link').on('click', function(event){
//     event.preventDefault();
//     $target = $(event.target)
//     $.ajax({
//       url: $target.attr('href')
//     }).done(function(response){
//       $('#event-create-ajax-div').append(response);
//     })
//   })
// });

$(document).ready(function() {
	$("#event-create-container").dialog({
    modal: true,
    autoOpen: false,
    minHeight: 800,
    width: 500,
    // appendTo: '#event-create-ajax-div',
    position: ({ my:"top", at: "middle", of: "#page-header-bottom"}),
    show: {
        effect: "blind",
        duration: 1000
    },
    hide: {
        effect: "explode",
        duration: 1000
    }
	});

  $('#event-create-link').on('click', function(event){
	event.preventDefault()
        // debugger;
    if (window.location.pathname.includes("venue") ) {
      barName = $('#venue-name').text()
      $('#event_location').val(barName);
      $('#event_location').prop('readonly', true);
    }
		// $form = $(event.target).next()
  	$("#event-create-container").dialog('open');
  })

});