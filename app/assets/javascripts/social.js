(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=117829128236888";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

(function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();

  

// OLD FACEBOOK SHARE FUNCTION
// $(document).ready(function() {
// 	$('.fb_share').click(function(){
// 		url = $(this).data('share-url') || window.location.href;
// 		alert(url)
// 		window.open('http://www.facebook.com/sharer.php?src=bm&v=4&i=1322830844&u=' + url,'sharer','toolbar=0,status=0,resizable=1,width=626,height=436');
// 	});
// });