
// $(document).ready(function() {
  function welcomePage(){
    // debugger;
  $("#login-box, #register-box").dialog(dialogOptions)

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