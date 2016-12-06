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
      // console.log(screen.height)
      return screen.height * 0.8
    } else {
      // console.log(screen.height)
      return screen.height
    }
  }
$(document).ready(function() {

  $('#new-review-form').dialog({
    modal: true,
    autoOpen: false,
    height: setHeight,
    width: setFormWidth,
    position: ({ my:"top", at: "middle", of: ".top-bar"}),
  });
  $('.new-review-button').on('click', function(event){
    event.preventDefault()
    $('#new-review-form').dialog('open');
  })

  var emptyReviewConent = function() {
    $('#full-review-content').html("");
  }

  $('#full-review-content').dialog({
    modal: true,
    autoOpen: false,
    // minHeight: 200,
    // height: screen.height * 0.50,
    // minWidth: 100,
    minWidth: $(window).width() * 0.40,
    minHeight: screen.height * 0.40,
    // width: $(window).width() * 0.50,
    position: ({ my:"center top", at: "center bottom", of: ".top-bar"}),
    close: emptyReviewConent
  });
  $('.read-more-review').on('click', function(event){
    event.preventDefault()
    $('#full-review-content').dialog('open')
    $.ajax({
      url: this.href
    }).done(function(response){
      $('#full-review-content').html(response);
    })
  })
});
