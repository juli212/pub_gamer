$(document).ready(function() {
	$('#edit-user-profile-box').dialog(dialogOptions, {
		// position: userFormPosition
	}).parent().draggable();

	$('#edit-user-profile, #edit-own-profile').on('click', function(event){
		event.preventDefault();
		$('#edit-user-profile-box').dialog('open')
		$.ajax({
			url: this.href
		}).done(function(response){
			$('#edit-user-profile-box').html(response);
		})
	})

	$('#edit-user-profile-box').on('click', '#edit-password-link', function(event){
		event.preventDefault();
		$.ajax({
			url: this.href
		}).done(function(response){
			$('#edit-user-profile-box').html(response);
		})
	})

	$('#edit-user-profile-box').on('submit', '#update-password-form', function(event){
	})

	$('#delete-user-profile').on('click', function(event){
		var sure = confirm("Are you sure you want to delete your profile?");
		if (sure == false) {
			event.preventDefault();
			event.stopPropagation();
		}
	})
})