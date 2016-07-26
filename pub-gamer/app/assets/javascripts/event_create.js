$(document).ready(function() {
  $('#event-create-link').on('click', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr('href')
    }).done(function(response){
      $('#event-create-ajax-div').append(response);
    })
  })
});