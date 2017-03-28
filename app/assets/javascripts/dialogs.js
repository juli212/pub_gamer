var $width = $(window).width()
var $height = $(window).height()

var setHeight = function() {
  if ($width >= 640) {
    return screen.height * 0.8
  } else {
    return screen.height
  }
}
var setFormWidth = dialogWidth($width, $height)
var setFormHeight = dialogHeight($width, $height)


function dialogWidth(w, h) {
  if(h > 500) {
    var width
    if (w >= 1024) {
      width = w * 0.5
    } else if (w >= 640) {
      width = w * 0.7
    } else {
      width = w * 0.95
    } 
  } else {
    width = w * 0.9
  }
  return width
}

function dialogHeight(w, h) {
  if(h >= 500) {
    if(w >= 1024) {
      return h * 0.8
    } else if(w >= 640) {
      return h * 0.8
    } else {
      return h * 0.95
    }
  } else {
    return h * 0.95
  }
}

// default dialog close function:
var closeDialogWindow = function(){
  $(this).find('form')[0].reset()
  // startScroll()
}

// alternate dialog close function, empties dialog box:
var emptyDialogBox = function() {
  $(this).html("");
}

var reviewShowWidth = function(){
  if ($width >= 1024) {
    return $width * 0.4
  } else if ($width >= 640 ) {
    return $width * 0.5
  } else {
    return $width * 0.95
  }
}

var reviewShowHeight = function(){
  if ($width >= 640) {
    return screen.height * 0.5
  } else {
    return screen.height * 0.8
  }
}

function stopScroll() {
  $('body').css('overflow', 'hidden')
}

var stopScrolling = stopScroll($('body'))

function startScroll() {
  $('body').css('overflow', 'visible')
}

var userFormPosition = ({ my: 'middle top', at: 'middle top+10', of: window, collision: 'fit' })

var dialogOptions = {
  modal: true,
  autoOpen: false,
  open: function (event, ui) {
    $("body").css('overflow', 'hidden' )
  },
  maxHeight: setFormHeight,
  width: setFormWidth,
  draggable: false,
  position: userFormPosition,
  beforeClose: function(event, ui) {
    $('body').css('overflow', 'inherit')
  },
  close: closeDialogWindow
}

$(window).resize(function(event) {
  var $wid = $(window).width()
  var $hei = $(window).height()
  dialogOptions.width = dialogWidth($wid, $hei)
  dialogOptions.maxHeight = dialogHeight($wid, $hei)
  $('.ui-dialog-content').dialog({
    width: dialogOptions.width,
    maxHeight: dialogOptions.maxHeight,
    position: userFormPosition
  })
}).resize()