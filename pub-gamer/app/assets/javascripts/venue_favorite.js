$(document).ready(function() {
  $('.user-favorite-status').on('click', 'a', function(event){
    event.preventDefault();
    // debugger;
    $('.index-bottom-notice p').text("");
    $target = $(this)
    $.ajax({
      url: this.href,
      method: 'put'

    }).done()
  // debugger;
  })
});