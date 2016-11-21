$(document).ready(function() {
	// var width = $(window).width()
 //  var setFormWidth = function() {
 //    if (width >= 640) {
 //      return width * 0.7
 //    } else {
 //      return width
 //    }
 //  }

	$('#edit-user-profile-box').dialog({
		modal: true,
		autoOpen: false,
		width: setFormWidth,
		// minHeight: 500,
		height: setHeight,
		position: ({ my: "top", at: "center", of: ".top-bar" })
	})

	$('#edit-user-profile').on('click', function(event){
		event.preventDefault();
		$('#edit-user-profile-box').dialog('open')
		$.ajax({
			url: this.href
		}).done(function(response){
			$('#edit-user-profile-box').html(response);
		})
	})

	$('#edit-user-profile-box').on('click', '#edit-password-link', function(event){
		// debugger;
		event.preventDefault();
		// event.stopPropagation();
		$.ajax({
			url: this.href
		}).done(function(response){
			debugger;
			console.log(response);
			$('#edit-user-profile-box').html(response);
		})
	})

	$('#edit-user-profile-box').on('submit', '#update-password-form', function(event){
		debugger;
	})

	$('#delete-user-profile').on('click', function(event){
		var sure = confirm("Are you sure you want to delete your profile?");
		if (sure == false) {
			event.preventDefault();
		}
		// debugger;
	})
})