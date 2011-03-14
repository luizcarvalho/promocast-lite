var WidgetItems = [{"href":"http:\/\/css-tricks.com\/css3-loading-spinner\/","title":"CSS3 Loading\u00a0Spinner","source":"css-tricks.com"},{"href":"http:\/\/www.vanseodesign.com\/blogging\/smashing-book-2\/","title":"8 Things I Learned Working On A Book","source":"vanseodesign.com"},{"href":"http:\/\/www.hongkiat.com\/blog\/how-to-measure-front-end-website-performance\/","title":"How To Measure Front-end Website Performance","source":"hongkiat.com"},{"href":"http:\/\/designshack.co.uk\/articles\/graphics\/how-to-design-a-professional-powerpoint-presentation","title":"How to Design a Professional PowerPoint Presentation","source":"designshack.co.uk"},{"href":"http:\/\/sixrevisions.com\/project-management\/four-constants-in-the-ever-changing-web-design-industry\/","title":"Four Constants in the Ever-changing Web Design Industry","source":"sixrevisions.com"},{"href":"http:\/\/www.webdesignerdepot.com\/2011\/02\/whats-new-for-web-designers-february-2011\/","title":"What\u2019s New for Web Designers \u2013 February 2011","source":"webdesignerdepot.com"},{"href":"http:\/\/www.noupe.com\/wallpaper\/dark-wallpapers-for-bright-inspiration.html","title":"Dark Wallpapers for Bright Inspiration","source":"noupe.com"},{"href":"http:\/\/www.onextrapixel.com\/2011\/02\/10\/twitter-design-inspiring-twitter-background-resources\/","title":"Twitter Design \u2013 Inspiring Twitter Background & Resources","source":"onextrapixel.com"},{"href":"http:\/\/www.1stwebdesigner.com\/css\/creating-cms-2-access-levels-administrators\/","title":"Creating Your Own CMS Part 2 \u2013 Access Levels & Administrators","source":"1stwebdesigner.com"},{"href":"http:\/\/net.tutsplus.com\/articles\/web-roundups\/30-developers-you-must-subscribe-to-as-a-javascript-junkie\/","title":"30 Developers you MUST Subscribe to as a JavaScript Junkie","source":"net.tutsplus.com"}];
var SmashingWidget = {
	filtersource : null,
	params_def : [],
	params : [],
	init : function() {
		this.params_def.items = 5;	
		this.params_def.cssclass = 'default';	
		this.params_def.targetid = 'smashingwidget1';	
	},
	addevent : function( obj, type, fn ) // http://ejohn.org/blog/flexible-javascript-events/
	{
		if (obj.addEventListener) 
		{
			obj.addEventListener( type, fn, false );
		} else if (obj.attachEvent) 
		{
			obj["e"+type+fn] = fn;
			obj[type+fn] = function() { obj["e"+type+fn]( window.event ); };
			obj.attachEvent( "on"+type, obj[type+fn] );
		}
	},
	getparam : function(opt) { 
		if(typeof(SmashingWidgetConfig) !== 'undefined' && typeof(SmashingWidgetConfig[opt]) !== 'undefined')
		{
			return SmashingWidgetConfig[opt];
		}
		if(typeof(this.params_def[opt]) !== 'undefined')
		{ 
			return this.params_def[opt];
		}
		return false;
	},
	myMatch : function(obj,filter)
	{
		if(filter === false || filter.length < 1)
		{
			return false;
		}
		filter = filter.replace(/[^a-z]/, '');
		pattern=eval("/"+filter + "/");
		if(obj.match(pattern) !== null)
		{
			//console.log('filtering:'+filter);
		}
		return obj.match(pattern) !== null;
	},				
	addItem : function(item,last)
	{
		if(!SmashingWidget.myMatch(item.source,SmashingWidget.filtersource))
		{
			var my_li = document.createElement('li'), my_liclass = document.createAttribute("class");
			my_liclass.nodeValue = (last?'sw-last':'');
			my_li.setAttributeNode(my_liclass);
			
			var my_a = document.createElement("a"), my_aclass = document.createAttribute("class"), my_href = document.createAttribute("href"), my_atxt = document.createTextNode(item.title);
			my_aclass.nodeValue = 'sw-title';
			my_href.nodeValue = item.href;
			my_a.setAttributeNode(my_aclass);
			my_a.setAttributeNode(my_href);
			my_a.appendChild(my_atxt);
						
			var my_div = document.createElement("div"), my_txt = document.createTextNode(item.source);
			var my_class = document.createAttribute("class");
			my_class.nodeValue = 'sw-source';
			my_div.setAttributeNode(my_class);
			my_div.appendChild(my_txt);
						
			my_li.appendChild(my_a);
			my_li.appendChild(my_div);
			return my_li;
		}
		return null;
	},
	printlist : function() 
	{
		var my_div = document.createElement("div");
		var my_divclass = document.createAttribute("class");
		my_divclass.nodeValue = 'smashingwidget '+SmashingWidget.getparam('cssclass');
		my_div.setAttributeNode(my_divclass);

		var my_h3 = document.createElement("h3");
		SmashingWidget.addevent(my_h3, 'click', function(){window.location = 'http://www.smashingmagazine.com/network-posts/';});

		var my_a = document.createElement("a"), my_href = document.createAttribute("href");
		my_href.nodeValue = "http://www.smashingmagazine.com/network-posts/";
		my_a.setAttributeNode(my_href);

		var my_span = document.createElement("span"), my_spantext = document.createTextNode("Smashing Network");
		my_span.appendChild(my_spantext);

		var my_img = document.createElement("img"), my_src = document.createAttribute("src"), my_alt = document.createAttribute("alt");
		my_src.nodeValue = "http://media.smashingmagazine.com/cdn_smash/files/smashing-widget/v006/img/sn-icon-style-6-32px.png?v=006";
		my_alt.nodeValue = "Smashing Network";
		my_img.setAttributeNode(my_src);
		my_img.setAttributeNode(my_alt);
		
		var my_ol = document.createElement("ol"), added = 0, li_t = null; 
		
		SmashingWidget.filtersource = SmashingWidget.getparam('filtersource');
		
		for(var i = 0; i<WidgetItems.length-1 && added<parseInt(SmashingWidget.getparam('items'),10)-1;i++)
		{
			if(WidgetItems[i] !== undefined)
			{
				li_t = SmashingWidget.addItem(WidgetItems[i], false);
				if(li_t !== null)
				{					
					my_ol.appendChild(li_t);
					added++;
				}
			}
		}

		added = 0;
		for(var y = i; y<WidgetItems.length && added<1;y++)
		{			
			if(WidgetItems[y] !== undefined)
			{
				li_t = SmashingWidget.addItem(WidgetItems[y], true);
				
				if(li_t !== null)
				{		
					my_ol.appendChild(li_t);			
					added++;
				}
			}
		}

		my_a.appendChild(my_span);
		my_a.appendChild(my_img);
		my_h3.appendChild(my_a);
		my_div.appendChild(my_h3);
		my_div.appendChild(my_ol);		
		
		var rep = document.getElementById(SmashingWidget.getparam('targetid'));
		rep.parentNode.insertBefore(my_div,rep);	
	}
};

SmashingWidget.init();
SmashingWidget.printlist();