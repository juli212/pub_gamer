$(document).ready(function() {
  $('.face').on('click', function(event){
  	selected_div = event.target.closest('.face')
   $(selected_div).toggleClass('selected');
   $(selected_div).find('input').prop('checked', !$(selected_div).find('input').prop('checked'));
  })
});