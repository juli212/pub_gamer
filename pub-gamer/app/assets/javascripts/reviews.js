$(document).ready(function() {
  $('#new_review').on('submit', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){
      $('#reviews').prepend(response);
      $('#new_review').each(function(){
        this.reset();
      });
    })
  })
});
