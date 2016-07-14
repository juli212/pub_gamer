$(document).ready(function() {
  $('.octopus img').on('click', function(event){
    selected_div = event.target.parentNode;
    rating_value = $(selected_div).children('input').attr('value')
    $('.rated').removeClass('rated')
    $(selected_div).addClass('rated')
    $(selected_div).find('input').prop('checked', true)
    $(selected_div).prevAll('.octopus').addClass('rated')
  })
   $('.octopus img').on('mouseover', function(event){
    selected_div = event.target.parentNode;
    rating_value = $(selected_div).children('input').attr('value')
    $('.rate').removeClass('rate')
    $(selected_div).addClass('rate')
    $(selected_div).prevAll('.octopus').addClass('rate')
  })
  $('.octopus img').on('mouseout', function(event){
  	$('.rate').removeClass('rate')
  })
});