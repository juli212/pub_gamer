// $(document).ready(function() {

//   $('#login a').on('click', function(event){
//     event.preventDefault();
//     $target = $(event.target)
//     $.ajax({
//       url: $target.attr('href')
//     }).done(function(response){
//         $('#form-container').html(response).hide().fadeIn(300);
//     })
//   })

//   $('#register a').on('click', function(event){
//     event.preventDefault();
//     $target = $(event.target)
//     $.ajax({
//       url: $target.attr('href')
//     }).done(function(response){
//         $('#form-container').html(response).hide().fadeIn(300);
//     })
//   })
// });


$(document).ready(function() {
  $("#login-box").dialog({
    modal: true,
    autoOpen: false,
    minHeight: 200,
    width: 200,
    // appendTo: "#form-box",
    position: ({ my: "bottom", at: "center top", of: "#form-box" }),
    show: {
        effect: "bounce",
        duration: 1500
    },
    hide: {
        effect: "explode",
        duration: 2000
    }
  });

  $('#login').on('click', function(event){
		event.preventDefault()
		$form = $(event.target).next()
  	$('#login-box').dialog('open');
  })

  $("#register-box").dialog({
    modal: true,
    autoOpen: false,
    minHeight: 200,
    width: 200,
    appendTo: "#form-box",
    position: ({ my: "bottom", at: "center top", of: "#form-box" }),
    show: {
        effect: "bounce",
        duration: 1500
    },
    hide: {
        effect: "explode",
        duration: 2000
    }
	});

  $('#register').on('click', function(event){
		event.preventDefault()
		$form = $(event.target).next()
  	$('#register-box').dialog('open');
  })
});