$(document).ready(function() {
  $('.face').on('click', function(event){
<<<<<<< 3840b2dad8094564896057fa0c404bce8e59b2eb
  	// if (event.target.nodeName == "DIV"){
  	// 	selected_div = event.target;
  	// } else if (event.target.nodeName == "IMG"){
   //  	selected_div = event.target.parentElement;
  	// }
  	selected_div = event.target.closest('.face')
=======
  	if (event.target.nodeName == "DIV"){
  		selected_div = event.target;
  	} else if (event.target.nodeName == "IMG"){
    	selected_div = event.target.parentElement;
  	}
>>>>>>> update review vibes to select multiple vibes
   $(selected_div).toggleClass('selected');
   $(selected_div).find('input').prop('checked', !$(selected_div).find('input').prop('checked'));
  })
});