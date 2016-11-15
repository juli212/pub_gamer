$(document).ready(function() {
  var setMessageValue = function(message){
    if (message == "add"){
      return "Venue added to favorites"
    } else if (message == "remove") {
      return "Venue removed from favorites"
    }
  }

  $('.fav-button-div').on('click', 'form', function(event){
    event.preventDefault();
    var notice = $(this).closest('.index-bottom').find('.index-bottom-notice p')
    var message = $(this).children("input[name='act']").val()
    var messageValue = setMessageValue(message);
    $target = $(event.target).closest('form')
    $.ajax({
      url: $target.attr('action'),
      method: $target.children('input').first().attr('value'),
      data: $target.serialize()
    }).done(function(response){
      $target.replaceWith(response)
    })
    notice.text(messageValue)
    setTimeout(function(){
      notice.text("")
    }, 3000);
  })
});