$(document).ready(function() {

	var navAjax = function() {
		$.ajax({
			url: $(navLink).attr("href")
		}).done( function(data) {;
			$('div.container').replaceWith(data)
		}).fail(function() {
			console.log("error")
		});
	}

	$('#register').on('click', function(event){
		navLink = $(this);
		event.preventDefault();
		navAjax(navLink);
	});

	$('#login').on('click', function(event){
		navLink = $(this);
		event.preventDefault();
		navAjax(navLink);
	});

	$('#user').on('click', function(event){
		navLink = $(this);
		event.preventDefault();
		navAjax(navLink);
	});

	$('#logout').on('click', function(event){
		event.preventDefault();
		$form = $(this).closest("form");
		$.ajax({
			url: $form.attr("action"),
			type: $form.find("input[type=hidden]").val()
		}).done( function(data) {;
			$('body').replaceWith(data)
		}).fail(function() {
			console.log("error")
		});
	});

	// $('#home').on('click', function(event){
	// 	navLink = $(this);
	// 	event.preventDefault();
	// 	navAjax(navLink);
	// });
});
