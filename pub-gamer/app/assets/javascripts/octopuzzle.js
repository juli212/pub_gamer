$(document).ready(function() {
  $('#octopuzzle-start-button').on('click', function() {
    $(this).prop('disabled', true)
    $('#octopuzzle-reset-button').prop('disabled', false)
  	startReset();
  })

  $('#octopuzzle-reset-button').on('click', function() {
    startReset();
  })

	$('.puzzle-box').on('click', '.puzzle-piece', function(){
	  rotatePiece(this)
	  if ($('.puzzle-box .rotate-0').length == 9 ) {
	  	$('.puzzle-piece').removeClass('rotate-0 rotate-90 rotate-180 rotate-270')
      $('.win-message').toggle().delay(1500).fadeOut(3000)
	  	$('.puzzle-piece').addClass('solved')
		}
	})
})

startReset = function() {
  $('.win-message').css('display', 'none')
  $('.puzzle-piece').removeClass('solved rotate-0 rotate-90 rotate-180 rotate-270')
  $('.puzzle-box .puzzle-piece').each(function(){
    var i = Math.floor(Math.random() * 4)
    var degreeClass = ["rotate-0", "rotate-90", "rotate-180", "rotate-270"]
    $(this).addClass(degreeClass[i]);
  })
}

rotatePiece = function(piece){	
	var $this = $(piece);

  if ( $this.hasClass("rotate-0") ) {
  	$this.removeClass("rotate-0");
  	$this.addClass("rotate-90");
  } else if ($this.hasClass("rotate-90") ) {
  	$this.removeClass("rotate-90");
  	$this.addClass("rotate-180");
  } else if ($this.hasClass("rotate-180") ) {
  	$this.removeClass("rotate-180");
  	$this.addClass("rotate-270");
  } else if ($this.hasClass("rotate-270") ) {
  	$this.removeClass("rotate-270");
  	$this.addClass("rotate-0");
  }
}

changeImage = function(url) {
  $('.piece').css("background-image", "url("+ url +")")
}
