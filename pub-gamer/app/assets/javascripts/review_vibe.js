$(document).ready(function() {
  $('.face img').on('click', function(event){
    // target = event.target
    selected_div = event.target.parentNode;
    // debugger;
    $('.selected').removeClass('selected')
    $(selected_div).addClass('selected')
    $(selected_div).find('input').prop('checked', true)
  })
});