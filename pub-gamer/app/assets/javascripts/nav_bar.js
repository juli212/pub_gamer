
// function getPageName(url) {
//     var index = url.lastIndexOf("/") + 1;
//     var filenameWithExtension = url.substr(index);
//     var filename = filenameWithExtension.split(".")[0];
//     return filename;
// }

//   $(function(){
//      var currentPageName = getPageName(window.location.pathname);
//      $('#' + currentPageName).css('color', '#EDD0AF');
//      $('#' + currentPageName).parent().css('background-color', '#635A8E')
//   });

// $(document).ready(function() {
// 	$('.nav-highlight').hover(function(event) {
// 		link = event.target
// 		$(link).css('color', 'green');
// 	})
// 	$('.top-bar ul li').hover(function(event) {
// 		link = event.target
// 		if ($(link).hasClass('nav-highlight') ) {
// 		// debugger;
// 			$(link).children().css('color', "green");
// 			$(link).on('mouseout', function(event) {
// 				debugger;
// 			})
// 		} else {
// 			$(link).css('color', '#EDD0AF');
// 		}
// 	})
// });


  	// selected_div = event.target.closest('.face')
  	// $(selected_div).children('.vibe-name').toggleClass('show-vibe');