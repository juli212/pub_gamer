$(document).ready(function() {
  $('.octopus img').on('click', function(event){
    selected_div = event.target.parentNode;
    $('.rated').removeClass('rated')
    $(selected_div).addClass('rated')
    // $(selected_div).find('input').prop('checked', true)
  })
   $('.octopus img').on('mouseover', function(event){
    selected_div = event.target.parentNode;
    $('.rated').removeClass('rated')
    $(selected_div).addClass('rated')
  })
});