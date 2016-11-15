$(document).ready(function() {
	$('#edit-user-profile-box').dialog({
		modal: true,
		autoOpen: false,
		Width: $(window).width() * 0.7,
		position: ({ my: "top", at: "center", of: ".top-bar" })
	})

	$('#edit-user-profile').on('click', function(event){
		event.preventDefault();
		$('#edit-user-profile-box').dialog('open')
		$.ajax({
			url: this.href
		}).done(function(response){
			$('#edit-user-profile-box').html(response);
			$('#register-button').val('Update')
		})
	})
	$('#delete-user-profile').on('click', function(event){
		// debugger;
		var sure = confirm("Are you sure you want to delete your profile?");
		if (sure == false) {
			event.preventDefault();
		}
		// debugger;
	})
})