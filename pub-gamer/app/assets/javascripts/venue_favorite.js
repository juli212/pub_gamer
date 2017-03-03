$(document).ready(function() {
  $('.user-status').on('click', 'a', function(event){
    event.preventDefault();
    $target = $(this)
    $.ajax({
      url: this.href,
      method: 'put'
    }).done()
  })
});

var favoriteTimer
function favTimer(element, note){
	if (favoriteTimer){
		clearTimeout(favoriteTimer);
		favoriteTimer = null
	}
	element.text(note);
	element.stop().animate({opacity: '100'});
	favoriteTimer = setTimeout(function(){
		element.fadeOut(4500, function(){
			element.text("").removeAttr('style');
		})
	}, 1000)
}