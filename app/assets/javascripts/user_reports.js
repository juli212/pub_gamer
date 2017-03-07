$(document).ready(function(){
	$('#user-report-box').dialog(dialogOptions).parent().draggable();

	$('#venue-show').on('click', '.report-inaccurate-button', function(event){
		event.preventDefault();
		$.ajax({
			url: this.href
		}).done(function(response){
			$('#user-report-box').dialog('open');
			$('#user-report-box').html(response);

		})
	})
})