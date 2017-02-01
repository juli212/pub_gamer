
var width = $(window).width()
var height = screen.height
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
  $(this).find('form')[0].reset()
}

// alternate dialog close function, empties dialog box:
var emptyDialogBox = function() {
    $(this).html("");
  }

var openFunction = function(){
  $('.ui-button, .ui-dialog .ui-button').blur()
}

var reviewShowWidth = function(){
  if (width >= 1024) {
    return width * 0.4
  } else if (width >= 640 ) {
    return width * 0.5
  } else {
    return width
  }
}

var reviewShowHeight = function(){
  if (width >= 640) {
    return screen.height * 0.5
  } else {
    return screen.height * 0.8
  }
}

var dialogOptions = {
	modal: true,
  autoOpen: false,
  maxHeight: setFormHeight,
  width: setFormWidth,
  position: ({ my: 'top', at: 'middle', of: '.top-bar'}),
  open: openFunction,
	close: closeDialogWindow
}