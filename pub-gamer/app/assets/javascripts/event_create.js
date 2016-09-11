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
    appendTo: '#event-create-ajax-div',
    position: ({ my: "left top", at: "left top", of: "#event-create-ajax-div" }),
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
		// $form = $(event.target).next()
  	$("#event-create-container").dialog('open');
  })

});