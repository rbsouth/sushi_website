$(function (){

	var maxLength = 150;
	$('#postTextArea').keyup(function() {
	  var length = $(this).val().length;
	  var length = maxLength-length;
	  $('#chars').text(length);
	});

	$(document).on('click', '#newPostBtn', function (){
		$('#newPostModal').modal('toggle');
	});

});
