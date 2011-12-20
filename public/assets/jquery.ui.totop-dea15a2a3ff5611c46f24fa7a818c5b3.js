/*
|--------------------------------------------------------------------------
| UItoTop jQuery Plugin 1.1
| http://www.mattvarone.com/web-design/uitotop-jquery-plugin/
|--------------------------------------------------------------------------
*/
(function(a){a.fn.UItoTop=function(b){var c={text:"To Top",min:200,inDelay:600,outDelay:400,containerID:"toTop",containerHoverID:"toTopHover",scrollSpeed:1200,easingType:"linear"},d=a.extend(c,b),e="#"+d.containerID,f="#"+d.containerHoverID;a("body").append('<a href="#" id="'+d.containerID+'">'+d.text+"</a>"),a(e).hide().click(function(){return a("html, body").animate({scrollTop:0},d.scrollSpeed,d.easingType),a("#"+d.containerHoverID,this).stop().animate({opacity:0},d.inDelay,d.easingType),!1}).hover(function(){a(this).stop().animate({opacity:1},100,"linear")},function(){a(this).stop().animate({opacity:.6},100,"linear")}),a(window).scroll(function(){var b=a(window).scrollTop();typeof document.body.style.maxHeight=="undefined"&&a(e).css({position:"absolute",top:a(window).scrollTop()+a(window).height()-50}),b>d.min?a(e).fadeIn(d.inDelay):a(e).fadeOut(d.Outdelay)})}})(jQuery)