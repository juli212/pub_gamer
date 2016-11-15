
$(document).ready(function() {
  $("#login-box").dialog({
    modal: true,
    autoOpen: false,
    minHeight: 200,
    width: setFormWidth,
    position: ({ my: "middle", at: "center", of: window }),
    hide: {
      effect: "explode",
      duration: 1000
    }
  });

  $('#login').on('click', function(event){
		event.preventDefault()
		$form = $(event.target).next()
  	$('#login-box').dialog('open');
  })

  var width = $(window).width()
  var setFormWidth = function() {
    if (width >= 640) {
      return width * 0.7
    } else {
      return width
    }
  }

  $("#register-box").dialog({
    modal: true,
    autoOpen: false,
    width: setFormWidth,
    minHeight: 200,
    appendTo: "#form-box",
    position: ({ my: "middle", at: "center", of: window }),
    hide: {
      effect: "explode",
      duration: 1000
    }
	});

  $('#register').on('click', function(event){
		event.preventDefault()
		$form = $(event.target).next()
  	$('#register-box').dialog('open');
  })
});