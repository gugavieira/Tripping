/*
	--------------------------------
	Infinite Scroll
	--------------------------------
	+ https://github.com/paulirish/infinitescroll
	+ version 2.0b2.110713
	+ Copyright 2011 Paul Irish & Luke Shumard
	+ Licensed under the MIT license
	
	+ Documentation: http://infinite-scroll.com/
	
*/
(function(a,b,c){b.infinitescroll=function(a,c,d){this.element=b(d),this._create(a,c)},b.infinitescroll.defaults={loading:{finished:c,finishedMsg:"<em>Congratulations, you've reached the end of the internet.</em>",img:"http://www.infinite-scroll.com/loading.gif",msg:null,msgText:"<em>Loading the next set of posts...</em>",selector:null,speed:"fast",start:c},state:{isDuringAjax:!1,isInvalidPage:!1,isDestroyed:!1,isDone:!1,isPaused:!1,currPage:1},callback:c,debug:!1,behavior:c,binder:b(a),nextSelector:"div.navigation a:first",navSelector:"div.navigation",contentSelector:null,extraScrollPx:150,itemSelector:"div.post",animate:!1,pathParse:c,dataType:"html",appendCallback:!0,bufferPx:40,errorCallback:function(){},infid:0,pixelsFromNavToBottom:c,path:c},b.infinitescroll.prototype={_binding:function(a){var b=this,d=b.options;if(!!d.behavior&&this["_binding_"+d.behavior]!==c){this["_binding_"+d.behavior].call(this);return}if(a!=="bind"&&a!=="unbind")return this._debug("Binding value  "+a+" not valid"),!1;a=="unbind"?this.options.binder.unbind("smartscroll.infscr."+b.options.infid):this.options.binder[a]("smartscroll.infscr."+b.options.infid,function(){b.scroll()}),this._debug("Binding",a)},_create:function(a,d){if(!this._validate(a))return!1;var e=this.options=b.extend(!0,{},b.infinitescroll.defaults,a),f=/(.*?\/\/).*?(\/.*)/,g=b(e.nextSelector).attr("href");e.contentSelector=e.contentSelector||this.element,e.loading.selector=e.loading.selector||e.contentSelector;if(!g){this._debug("Navigation selector not found");return}e.path=this._determinepath(g),e.loading.msg=b('<div id="infscr-loading"><img alt="Loading..." src="'+e.loading.img+'" /><div>'+e.loading.msgText+"</div></div>"),(new Image).src=e.loading.img,e.pixelsFromNavToBottom=b(document).height()-b(e.navSelector).offset().top,e.loading.start=e.loading.start||function(){b(e.navSelector).hide(),e.loading.msg.appendTo(e.loading.selector).show(e.loading.speed,function(){beginAjax(e)})},e.loading.finished=e.loading.finished||function(){e.loading.msg.fadeOut("normal")},e.callback=function(a,f){!!e.behavior&&a["_callback_"+e.behavior]!==c&&a["_callback_"+e.behavior].call(b(e.contentSelector)[0],f),d&&d.call(b(e.contentSelector)[0],f)},this._setup()},_debug:function(){if(this.options.debug)return a.console&&console.log.call(console,arguments)},_determinepath:function(a){var b=this.options;if(!b.behavior||this["_determinepath_"+b.behavior]===c){if(!b.pathParse){if(a.match(/^(.*?)\b2\b(.*?$)/))a=a.match(/^(.*?)\b2\b(.*?$)/).slice(1);else if(a.match(/^(.*?)2(.*?$)/)){if(a.match(/^(.*?page=)2(\/.*|$)/))return a=a.match(/^(.*?page=)2(\/.*|$)/).slice(1),a;a=a.match(/^(.*?)2(.*?$)/).slice(1)}else{if(a.match(/^(.*?page=)1(\/.*|$)/))return a=a.match(/^(.*?page=)1(\/.*|$)/).slice(1),a;this._debug("Sorry, we couldn't parse your Next (Previous Posts) URL. Verify your the css selector points to the correct A tag. If you still get this error: yell, scream, and kindly ask for help at infinite-scroll.com."),b.state.isInvalidPage=!0}return this._debug("determinePath",a),a}return this._debug("pathParse manual"),b.pathParse}this["_determinepath_"+b.behavior].call(this,a);return},_error:function(a){var b=this.options;if(!b.behavior||this["_error_"+b.behavior]===c)a!=="destroy"&&a!=="end"&&(a="unknown"),this._debug("Error",a),a=="end"&&this._showdonemsg(),b.state.isDone=!0,b.state.currPage=1,b.state.isPaused=!1,this._binding("unbind");else{this["_error_"+b.behavior].call(this,a);return}},_loadcallback:function(d,e){var f=this.options,g=this.options.callback,h=f.state.isDone?"done":f.appendCallback?"append":"no-append",i;if(!!f.behavior&&this["_loadcallback_"+f.behavior]!==c){this["_loadcallback_"+f.behavior].call(this,d,e);return}switch(h){case"done":return this._showdonemsg(),!1;case"no-append":f.dataType=="html"&&(e="<div>"+e+"</div>",e=b(e).find(f.itemSelector));break;case"append":var j=d.children();if(j.length==0)return this._error("end");i=document.createDocumentFragment();while(d[0].firstChild)i.appendChild(d[0].firstChild);this._debug("contentSelector",b(f.contentSelector)[0]),b(f.contentSelector)[0].appendChild(i),e=j.get()}f.loading.finished.call(b(f.contentSelector)[0],f);if(f.animate){var k=b(a).scrollTop()+b("#infscr-loading").height()+f.extraScrollPx+"px";b("html,body").animate({scrollTop:k},800,function(){f.state.isDuringAjax=!1})}f.animate||(f.state.isDuringAjax=!1),g(this,e)},_nearbottom:function(){var d=this.options,e=0+b(document).height()-d.binder.scrollTop()-b(a).height();if(!d.behavior||this["_nearbottom_"+d.behavior]===c)return this._debug("math:",e,d.pixelsFromNavToBottom),e-d.bufferPx<d.pixelsFromNavToBottom;this["_nearbottom_"+d.behavior].call(this);return},_pausing:function(a){var b=this.options;if(!b.behavior||this["_pausing_"+b.behavior]===c){a!=="pause"&&a!=="resume"&&a!==null&&this._debug("Invalid argument. Toggling pause value instead"),a=!a||a!="pause"&&a!="resume"?"toggle":a;switch(a){case"pause":b.state.isPaused=!0;break;case"resume":b.state.isPaused=!1;break;case"toggle":b.state.isPaused=!b.state.isPaused}return this._debug("Paused",b.state.isPaused),!1}this["_pausing_"+b.behavior].call(this,a);return},_setup:function(){var a=this.options;if(!a.behavior||this["_setup_"+a.behavior]===c)return this._binding("bind"),!1;this["_setup_"+a.behavior].call(this);return},_showdonemsg:function(){var a=this.options;if(!a.behavior||this["_showdonemsg_"+a.behavior]===c)a.loading.msg.find("img").hide().parent().find("div").html(a.loading.finishedMsg).animate({opacity:1},2e3,function(){b(this).parent().fadeOut("normal")}),a.errorCallback.call(b(a.contentSelector)[0],"done");else{this["_showdonemsg_"+a.behavior].call(this);return}},_validate:function(a){for(var c in a)return c.indexOf&&c.indexOf("Selector")>-1&&b(a[c]).length===0?(this._debug("Your "+c+" found no elements."),!1):!0},bind:function(){this._binding("bind")},destroy:function(){return this.options.state.isDestroyed=!0,this._error("destroy")},pause:function(){this._pausing("pause")},resume:function(){this._pausing("resume")},retrieve:function(a){var d=this,e=d.options,f=e.path,g,h,i,j,k,a=a||null,l=a?a:e.state.currPage;beginAjax=function(a){a.state.currPage++,d._debug("heading into ajax",f),g=b(a.contentSelector).is("table")?b("<tbody/>"):b("<div/>"),i=f.join(a.state.currPage),j=a.dataType=="html"||a.dataType=="json"?a.dataType:"html+callback",a.appendCallback&&a.dataType=="html"&&(j+="+callback");switch(j){case"html+callback":d._debug("Using HTML via .load() method"),g.load(i+" "+a.itemSelector,null,function(a){d._loadcallback(g,a)});break;case"html":case"json":d._debug("Using "+j.toUpperCase()+" via $.ajax() method"),b.ajax({url:i,dataType:a.dataType,complete:function(a,b){k=typeof a.isResolved!="undefined"?a.isResolved():b==="success"||b==="notmodified",k?d._loadcallback(g,a.responseText):d._error("end")}})}};if(!!e.behavior&&this["retrieve_"+e.behavior]!==c){this["retrieve_"+e.behavior].call(this,a);return}if(e.state.isDestroyed)return this._debug("Instance is destroyed"),!1;e.state.isDuringAjax=!0,e.loading.start.call(b(e.contentSelector)[0],e)},scroll:function(){var a=this.options,b=a.state;if(!!a.behavior&&this["scroll_"+a.behavior]!==c){this["scroll_"+a.behavior].call(this);return}if(b.isDuringAjax||b.isInvalidPage||b.isDone||b.isDestroyed||b.isPaused)return;if(!this._nearbottom())return;this.retrieve()},toggle:function(){this._pausing()},unbind:function(){this._binding("unbind")},update:function(a){b.isPlainObject(a)&&(this.options=b.extend(!0,this.options,a))}},b.fn.infinitescroll=function(a,c){var d=typeof a;switch(d){case"string":var e=Array.prototype.slice.call(arguments,1);this.each(function(){var c=b.data(this,"infinitescroll");if(!c)return!1;if(!b.isFunction(c[a])||a.charAt(0)==="_")return!1;c[a].apply(c,e)});break;case"object":this.each(function(){var d=b.data(this,"infinitescroll");d?d.update(a):b.data(this,"infinitescroll",new b.infinitescroll(a,c,this))})}return this};var d=b.event,e;d.special.smartscroll={setup:function(){b(this).bind("scroll",d.special.smartscroll.handler)},teardown:function(){b(this).unbind("scroll",d.special.smartscroll.handler)},handler:function(a,c){var d=this,f=arguments;a.type="smartscroll",e&&clearTimeout(e),e=setTimeout(function(){b.event.handle.apply(d,f)},c==="execAsap"?0:100)}},b.fn.smartscroll=function(a){return a?this.bind("smartscroll",a):this.trigger("smartscroll",["execAsap"])}})(window,jQuery)