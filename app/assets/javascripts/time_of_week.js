$(document).ready(function() {
	$('.week').on('touchstart click', function(event){
		selected_div = event.target.closest('.week');
		if (event.type == "touchstart" || event.type == "click") {
			$('.time-of-week').not(selected_div).removeClass('time-of-week');
			$(selected_div).toggleClass('time-of-week');
  		$(selected_div).find('input').prop('checked', !$(selected_div).find('input').prop('checked'));
			return false
		}
		return false
	})
});