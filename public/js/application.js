$(document).ready(function() {

	var navAjax = function() {
		$.ajax({
			url: $(navLink).attr("href")
		}).done( function(response) {;
			$('div.container').replaceWith(response)
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


	// $('#mountains').on('click', function(event){
	// 	event.preventDefault();
	// 	$.ajax({
	// 		url: 'http://api.wunderground.com/api/39c0d3e803311311/ski/CO/arapahoe_basin_ski_area.json',
	// 		type: 'get'
	// 	}).done( function(response) {
	// 		$('div.container').replaceWith(response.current_observation.display_location.full);
	// 	}).fail(function() {
	// 		console.log("error")
	// 	});
	// })
});
