$(document).ready(function() {

  $('#new_review').on('submit', function(event){
    event.preventDefault();
    // alert('wee')
    $target = $(event.target)
    debugger;
    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize
    }).done(function(response){
        $('#reviews').prepend(response);
    })
  })


});