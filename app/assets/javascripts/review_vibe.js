$(document).ready(function() {
  $('.face').on('touchstart click', function(event){
  	selected_div = event.target.closest('.face')
  	if (event.type == "touchstart" || event.type == "click") {
	  	$(selected_div).toggleClass('selected');
	  	$(selected_div).find('input').prop('checked', !$(selected_div).find('input').prop('checked'));
  		return false
  	}
  	return false
  })
  $('.face').hover(function(event){
  	selected_div = event.target.closest('.face')
  	$(selected_div).children('.vibe-name').toggleClass('show-vibe');
  })
});