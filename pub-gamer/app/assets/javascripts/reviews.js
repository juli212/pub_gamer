$(document).ready(function() {
  $('#new_review').on('submit', function(event){
    event.preventDefault();
    $target = $(event.target)
    $rating = $target.children('#rating').children('.rated').last().children('input').attr('value')
    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response){
      $('.rated').removeClass('rated')
      $('#reviews').prepend(response);
      $('.selected').removeClass('selected')
      $('#new_review').each(function(){
        this.reset();
      });
    })
    $.ajax({
      url: $target.children('#rating').attr('action'),
      method: 'put',
      data: $rating
    }).done(function(response){
      $('#avg-rating').html(response);
    })
  })
});
