$(document).ready(function() {
	$('.week').on('click', function(event){
		selected_div = event.target.closest('.week');
		$('.time-of-week').not(selected_div).removeClass('time-of-week');
		$(selected_div).toggleClass('time-of-week');
  	$(selected_div).find('input').prop('checked', !$(selected_div).find('input').prop('checked'));
	})
});