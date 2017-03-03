
// $(document).ready(function() {
    // debugger;
var welcomeWidth = function() {
  if (width >= 640) {
    return 350
  } else {
    return 300
  }
}
  function welcomePage(){
    $("#register-box").dialog(dialogOptions)
    $("#login-box").dialog(dialogOptions, {
      width: welcomeWidth
    })
  // }

  $('#login').on('click', function(event){
		event.preventDefault()
		$form = $(event.target).next()
  	$('#login-box').dialog('open');
  })


  // $("#register-box").dialog(dialogOptions)

  $('#register').on('click', function(event){
		event.preventDefault()
		$form = $(event.target).next()
  	$('#register-box').dialog('open');
  })
};
// });