$(document).ready(function() {
  // opens form for new venue review
  $('#new-review-form').dialog(dialogOptions)

  $('.new-review-button').on('click', function(event){
    event.preventDefault()
    $('#new-review-form').dialog('open');
  })

  // displays written review content
  $('#full-review-content').dialog(dialogOptions, {
    height: 350,
    close: emptyDialogBox
  })

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
