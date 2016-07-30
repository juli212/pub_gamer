$(document).ready(function() {
  $('.octopus').on('click', function(event){
    selected_div = event.target.closest('.octopus')
    rating_value = $(selected_div).children('input').attr('value')
    $('.rated').removeClass('rated')
    $(selected_div).addClass('rated')
    $(selected_div).find('input').prop('checked', true)
    $(selected_div).prevAll('.octopus').addClass('rated')
  })
  $('.octopus').on('mouseover', function(event){
    selected_div = event.target.closest('.octopus')
    $(selected_div).addClass('rate')
    $(selected_div).nextAll('.octopus').removeClass('rate')
    $(selected_div).prevAll('.octopus').addClass('rate')
  })
  $('#rating').on('mouseout', function(event){
    $('.rate').removeClass('rate')
  });
});