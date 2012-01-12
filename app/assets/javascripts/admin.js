//= require jquery-ui

// Drag and Drop to reorder photosets
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
});