$(document).ready(function() {
  $('.face img').on('click', function(event){
    target = event.target
    // debugger;
    $('.selected').removeClass('selected')
    $(target).addClass('selected');
    // alert('yup')
  })
});