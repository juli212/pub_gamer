$(document).ready(function() {
  // $('#new_review').on('submit', function(event){
  //   event.preventDefault();
  //   $target = $(event.target)
  //   $rating = $target.children('#rating').children('.rated').last().children('input').attr('value')
  //   $.ajax({
  //     url: $target.attr('action'),
  //     method: $target.attr('method'),
  //     data: $target.serialize()
  //   }).done(function(response){
  //     if ($(response).hasClass('venue-show-left')) {
  //       $('.rated').removeClass('rated')
  //       if ($('#no-reviews')) {
  //         $('#no-reviews').remove()
  //       }
  //       $('#reviews').prepend(response);
  //       $('.selected').removeClass('selected')
  //       $('.time-of-week').removeClass('time-of-week');
  //       $('#new-review-errors').html("");
  //       $('#new_review').each(function(){
  //         this.reset();
  //       });
  //     } else {
  //       $('#new-review-errors').html(response);
  //     }
  //   })
  //   $.ajax({
  //     url: $target.children('#rating').attr('action'),
  //     method: 'put',
  //     data: $rating
  //   }).done(function(response){
  //     $('#avg-rating').html(response);
  //     UpdateOctopusRating();
  //   })
  // })
  $('#new-review-form').dialog({
    modal: true,
    autoOpen: false,
    minHeight: 500,
    width: 500,
    // appendTo: ,
    position: ({ my:"top", at: "bottom", of: "#header-row"}),
    show: {
      effect: "bounce",
      duration: 1500
    },
    hide: {
      effect: "explode",
      duration: 2000
    }
  });

  $('#new-review-button').on('click', function(event){
    event.preventDefault()
    $('#new-review-form').dialog('open');
  })
});
