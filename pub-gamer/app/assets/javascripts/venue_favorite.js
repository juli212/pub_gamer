$(document).ready(function() {
  $('.user-status').on('click', 'a', function(event){
    event.preventDefault();
    $('.fav-notice').text("");
    $target = $(this)
    $.ajax({
      url: this.href,
      method: 'put'
    }).done()
  })
});