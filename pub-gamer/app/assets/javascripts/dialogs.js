
var width = $(window).width()
var setFormWidth = function() {
  if (width >= 1024) {
    return width * 0.5
  } else if (width >= 640) {
    return width * 0.7
  } else {
    return width
  }
}
var setHeight = function() {
  if (width >= 640) {
    return screen.height * 0.8
  } else {
    return screen.height
  }
}
var setFormHeight = setHeight()

// default dialog close function:
var closeDialogWindow = function(){
	debugger;
}

// alternate dialog close function, empties dialog box:
var emptyDialogBox = function() {
    $(this).html("");
  }

var dialogOptions = {
	modal: true,
	autoOpen: false,
	height: setFormHeight,
	width: setFormWidth,
	position: ({ my: 'top', at: 'middle', of: '.top-bar'}),
	close: closeDialogWindow
}