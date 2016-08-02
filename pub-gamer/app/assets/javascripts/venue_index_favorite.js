$(document).ready(function() {
  $('.venue-index-fav-button').on('click', function(event){
    event.preventDefault();
    $target = $(event.target).closest('form')
    $.ajax({
      url: $target.attr('action'),
      method: $target.children('input').first().attr('value'),
      data: $target.serialize()
    }).done(function(response){
      console.log(response);
      $('#venue-fav-sidebar').prepend(response);
      $target.parent().html("<p>Added to My Venues!</p>")
    })
  })
});