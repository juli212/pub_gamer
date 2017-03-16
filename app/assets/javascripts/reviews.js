$(document).ready(function() {
  // sets new review form as dialog
  $('#new-review-form').dialog(dialogOptions).parent().draggable();

  // opens form for new venue review
  $('.new-review-button').on('click', function(event){
    event.preventDefault()
    $('#new-review-form').dialog('open');
  })

  // submits new review form and updates venue rating
  $('#new_review').on('submit', function(event){
    event.preventDefault();
    target = this
    $.ajax({
      url: target.action,
      type: target.method,
      data: $(target).serialize()
    }).done()
    $('#new-review-form').dialog('close');
  })

  // displays written review content
  $('#full-review-content').dialog(dialogOptions, {
    width: reviewShowWidth,
    height: reviewShowHeight,
    position: ({ my: 'top', at: 'top+17%', of: window}),
    close: emptyDialogBox
  }).parent().draggable();

  $('#reviews').on('click', '.read-more-review', function(event){
    $target = $(event.target)
    event.preventDefault();
    $('#full-review-content').dialog('open')
    $.ajax({
      url: this.href
    }).done(function(response){
      $('#full-review-content').html(response);
      var $dialogBox = $('#full-review-content').parent()
      $dialogBox.on('mousedown', '#review-content', function(event){
        $dialogBox.draggable('disable');
      })
      $dialogBox.on('mouseup', '#review-content', function(event){
        $dialogBox.draggable('enable');
      })
    })
  })

  $('#full-review-content').on('click', '.delete-review', function(event){
    var sure = confirm("Are you sure you want to delete this review?");
    if (sure == false ) {
      event.preventDefault();
      event.stopPropagation();
    }
  })
});
