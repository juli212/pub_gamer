$(document).ready(function() {
  $('.face img').on('click', function(event){
    selected_div = event.target.parentNode;
    $('.selected').removeClass('selected')
    $(selected_div).addClass('selected')
    $(selected_div).find('input').prop('checked', true)
  })
});