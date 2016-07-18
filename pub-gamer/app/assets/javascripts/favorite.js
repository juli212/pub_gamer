$(document).ready(function() {
  $('#fav').on('submit', function(event){
    event.preventDefault();
    debugger;
    $target = $(event.target).parent()
    $.ajax({
    	url: $target.attr('action'),
    	method: $target.children('input').attr('value'),
    	data: $target.serialize()
    }).done(function(response){
    	$('#favorite').html(response)
    })
  })
});