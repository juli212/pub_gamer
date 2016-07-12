$(document).ready(function() {
  $('#new_review').on('submit', function(event){
    event.preventDefault();
    $target = $(event.target)
    // debugger;
    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){
      // debugger;
      $('#reviews').prepend(response);
      $('.selected').removeClass('selected')
      $('#new_review').each(function(){
        this.reset();
      });
    })
  })
});
