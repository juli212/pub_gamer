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
      debugger;
      if ($(response).hasClass('venue-show-left')) {
        $('.rated').removeClass('rated')
        $('#reviews').prepend(response);
        $('.selected').removeClass('selected')
        $('#new_review').each(function(){
          this.reset();
        });
      } else {
        $('#new-review-form').html(response);
      }
      // }debugger;
    }).fail(function(response){
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
