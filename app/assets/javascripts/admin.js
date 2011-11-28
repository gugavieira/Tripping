//= require jquery-ui

$(document).ready(function() {
	$( "#thumb_container" ).sortable({ handle: 'img', 
									   distance: 30,
									   containment: 'parent',
									   cursor: 'move',
									   items: 'div',
									   tolerance: 'pointer',
									   update: function() { $.post($(this).data('update-url'), $(this).sortable('serialize'))}   
    });
	$( "#thumb_container" ).disableSelection();

	$( "#save_order").click(function() {
		$.post($( "#thumb_container" ).data('update-url'), $( "#thumb_container" ).sortable('serialize'));
	});

});

// $.post($( "#thumb_container" ).data('update-url'), $(this).sortable('serialize')) });