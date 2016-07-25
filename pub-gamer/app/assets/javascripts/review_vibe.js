$(document).ready(function() {
  $('.face').on('click', function(event){
  	// if (event.target.nodeName == "DIV"){
  	// 	selected_div = event.target;
  	// } else if (event.target.nodeName == "IMG"){
   //  	selected_div = event.target.parentElement;
  	// }
  	selected_div = event.target.closest('.face')
   $(selected_div).toggleClass('selected');
   $(selected_div).find('input').prop('checked', !$(selected_div).find('input').prop('checked'));
  })
});