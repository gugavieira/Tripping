// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.infinitescroll.min
// require_tree .

$(document).ready(function() {
	$('.fb_share').click(function(){
		url = $(this).data('share-url') || window.location.href;
		alert(url)
		window.open('http://www.facebook.com/sharer.php?src=bm&v=4&i=1322830844&u=' + url,'sharer','toolbar=0,status=0,resizable=1,width=626,height=436');
	});
});