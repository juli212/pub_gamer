$(document).ready(function() {
  $('.fav-button-div').on('click', 'form', function(event){
    event.preventDefault();
    $('.index-bottom-notice p').text("");
    $target = $(event.target).closest('form')
    $.ajax({
      url: $target.attr('action'),
      method: $target.children('input').first().attr('value'),
      data: $target.serialize()
    }).done()
  })
});