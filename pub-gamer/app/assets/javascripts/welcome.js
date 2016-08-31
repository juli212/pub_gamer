$(document).ready(function() {

  $('#login a').on('click', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr('href')
    }).done(function(response){
        $('#form-container').html(response).hide().fadeIn(300);
    })
  })

  $('#register a').on('click', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      url: $target.attr('href')
    }).done(function(response){
        $('#form-container').html(response).hide().fadeIn(300);
    })
  })
});