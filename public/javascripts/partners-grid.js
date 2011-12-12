
//                    THIS IS FOR SHADOWING EFFECTING ON right-wrap

/* Created by Martin Hintzmann 2008 martin [a] hintzmann.dk
 * MIT (http://www.opensource.org/licenses/mit-license.php) licensed.
 *
 * Version: 0.1
 *
 * Requires:
 *   jQuery 1.2+
 */
// This is used for showing the shadow effect on the newsblast window
(function($) {
	$.fn.boxShadow = function(xOffset, yOffset, blurRadius, shadowColor) {
                var ua = $.browser;
		if (!ua.msie) return;
		if (!ua.mozilla && ua.version.slice(0,1) == "9") return;
                return this.each(function(){
			$(this).css({
				position:	"relative",
				zoom: 		1,
				zIndex:		"2"
			});
			$(this).parent().css({
					position:	"relative"
			});
			
			var div=document.createElement("div");
			$(this).parent().append(div);

			var _top, _left, _width, _height;
			if (blurRadius != 0) {
				$(div).css("filter", "progid:DXImageTransform.Microsoft.Blur(pixelRadius="+(blurRadius)+", enabled='true')");
				_top = 		yOffset-blurRadius-1;
				_left =		xOffset-blurRadius-1;
				_width =		$(this).outerWidth()+1;
				_height =	$(this).outerHeight()+1;
			} else {
				_top = 		yOffset;
				_left =		xOffset;
				_width = 	$(this).outerWidth();
				_height = 	$(this).outerHeight();
			}
			$(div).css({
				top: 			_top,
				left:			_left,
				width:		_width,
				height:		_height,
				background:	shadowColor,
				position:	"absolute",
				zIndex:		1
			});
			
	  });
	};
})(jQuery);








// Global Variables!!!

var toggleChip = true;     // determines whether the imige-l appears from left of right
var isScrolling = false;
var contentXML = new Array();       // this is for stupid ie because it can't just read the content out of the xml file...

$(window).load(
	function() {
	        doAjaxRead();  // Read the XML file that contains all the paragraphs

		$(".partner-grid").click(function () {

			var element = $(this);
			var content = "The way text is handled is, it will be a site admin function.  Then, ajax will be used to query for the literature on demand.  Here is essentially how it works http://stackoverflow.com/questions/5223699/new-to-rails-3-ajax-request-with-json-response";
			
			if (element.hasClass('hilite')) return;  // check if this is already selected...
			
			
			if ($(".hilite").length < 1)    // If this is your first time clicking one of the little boxes...
			{
				// change gc1 to include only items of the specified tag.  
				var chosenTag = $(this).attr('tag');   // TODO, make it so this chooses only the first tag
				detailsOfTag(chosenTag);
			}
			changeDisplayed(element);  // and content... damned refactoring
		})
		
		// This is used for showing the shadow effect on the newsblast window
		var ovvs = $('#news-blast').offset();
		var xLeft = ovvs['left'] - 0;   // 559
		var xTop = ovvs['top'] - 608;      // 148
		
                //alert(ovvs['top']);
                //xTop = -559;
		//alert(xTop);
		
		//$('#right-wrap').boxShadow( xLeft, xTop, '10', "#000" );
		
		//alert(ovvs['top']);   // var xLeft = ovvs['left'] - 634
		
		
		
		
});




function detailsOfTag(tag){
	$("#gc2, #gc3, #gc4, #gc5").hide(); // Switch to details mode
	// change gc1 to include only items of the specified tag.  
	removeUnwantedElements(tag);
	addWantedElements(tag);
	
	checkDisabledScrollButtons();  // displays scroll buttons if needed
}


function removeUnwantedElements(chosenTag){
	//var chosenTag = "paint";
	$('#iScroll').children().each(function(i){
		subTerms = $(this).children();
		var id = subTerms.attr('id');
		
		if (subTerms.attr('tag').indexOf(chosenTag) == -1)   // if this item doesn't have the chosen tag, toss it out
			subTerms.parent().appendTo('#gc2');
	});
}

function addWantedElements(chosenTag){
	// search gc2-gc5 and pick up any elements that have the chosen tag
	//alert('you seak: ' + chosenTag);
	$('#gc2').children().each(function(i){
		subTerms = $(this).children();
		var id = subTerms.attr('id');
		if (typeof subTerms.attr('tag') == 'undefined') return true;  // skip to next if this doesn't even have a tag...
		
		if (subTerms.attr('tag').indexOf(chosenTag) != -1)   // if this item DOES contain the chosen tag, move it to #iScroll
			subTerms.parent().appendTo('#iScroll');
	});
	
	$('#gc3').children().each(function(i){
		subTerms = $(this).children();
		var id = subTerms.attr('id');
		if (typeof subTerms.attr('tag') == 'undefined') return true;  // skip to next if this doesn't even have a tag...
		
		if (subTerms.attr('tag').indexOf(chosenTag) != -1)   // if this item DOES contain the chosen tag, move it to #iScroll
			subTerms.parent().appendTo('#iScroll');
	});
	$('#gc4').children().each(function(i){
		subTerms = $(this).children();
		var id = subTerms.attr('id');
		if (typeof subTerms.attr('tag') == 'undefined') return true;  // skip to next if this doesn't even have a tag...
		
		if (subTerms.attr('tag').indexOf(chosenTag) != -1)   // if this item DOES contain the chosen tag, move it to #iScroll
			subTerms.parent().appendTo('#iScroll');
	});
	$('#gc5').children().each(function(i){
		subTerms = $(this).children();
		var id = subTerms.attr('id');
		if (typeof subTerms.attr('tag') == 'undefined') return true;  // skip to next if this doesn't even have a tag...
		
		if (subTerms.attr('tag').indexOf(chosenTag) != -1)   // if this item DOES contain the chosen tag, move it to #iScroll
			subTerms.parent().appendTo('#iScroll');
	});
	
}


var disColor = '#ffffff';  //#F1F2EE
var enColor = '#F1F2EE';  //???

function disableTop(){
	$('#scroll-up').css('border-color', ' transparent transparent ' + disColor);
	$('#scroll-up').css('cursor', 'default');
}
function enableTop(){
	$('#scroll-up').css('border-color', ' transparent transparent ' + enColor);
	$('#scroll-up').css('cursor', 'hand');
}
function disableBottom(){
	$('#scroll-down').css('border-color', disColor + ' transparent transparent');
	$('#scroll-down').css('cursor', 'default');
}
function enableBottom(){
	$('#scroll-down').css('border-color', enColor + ' transparent transparent');
	$('#scroll-down').css('cursor', 'hand');
}

function checkDisabledScrollButtons(){
	var gc1 = $('#iScroll');
	var childs = gc1.children().length;
	
	// if number of elements is greater than 4, show both up and down  but disable top
	if (childs > 4)
	{
		$(".triangle").animate({opacity: 1.0}, 'slow' );
		
		var currentOffset = parseInt($('#iScroll').css('top').replace("px", ""));

		disableTop();
		
		if (currentOffset != 0)  // reset the position of the scroll bar incase it was scrolled downwards...
			$('#iScroll').css('top', 0);
		
	}
	
	else
	{// if number of elements is less than 5, opacitize down and up since you won't need them
		$(".triangle").animate({opacity: 0.0}, 'slow' );
	}
}


function gcScrollUp(){
	if (isScrolling == true) return;  // prevent spam clicking bug
	var ele = $('#iScroll');
	var currentOffset = parseInt(ele.css('top').replace("px", ""));
	// move the column of things up, then lazzily load the next item to become visible
	//alert(parseInt($('#iScroll').css('top').replace("px", "")));
	if (currentOffset<0)
	{
		isScrolling = true;
		ele.animate({ top: ['+=100', 'swing']},'slow', function (){
			isScrolling = false;
		});
		enableBottom();
		
		if (currentOffset+100>=0)
			disableTop();
	}
}


function gcScrollDown(){
	if (isScrolling == true) return;  // prevent spam clicking bug
	
	var ele = $('#iScroll');
	// get number of elements in iScroll
	var children = ele.children().length;
	var elementSpace = 100
	var limit = (children * elementSpace) - 4*elementSpace; // number of (children x width+padding per element) - 4x(width+padding)
	
	var currentOffset = parseInt(ele.css('top').replace("px", ""));
	
	
	//alert("Limit: " + limit);             // 300
	//alert("CurrentOffset: " + currentOffset); // -
	
	if (-currentOffset<limit)
	{
		isScrolling = true;
		ele.animate({ top: ['-=100', 'swing']},'slow', function (){
			isScrolling = false;
		});
		enableTop();
		if (-(currentOffset - elementSpace) >= limit)        // when 
		{
			disableBottom(); // set this buttons color to disabled
		}
	}
}



function changeSelectedButton(element){
	$(".partner-grid").removeClass("hilite");      // remove selectivity of all partner boxes
	element.addClass("hilite");                    // add selectivity to this box
}



function changeDisplayed(element) {  // changes the displayed content, including paragraph and main picture-l
	// the image path is based on the #id of the button elements
	var id = element.attr('id');
	
	var imgpath = "/images/partners-grid/" + id + "-l.jpg";    // the naming convention must be perfect on your images!!
	var imgMarkup = "<img id='" + id + "-l' " + "class='lovely-picture next-lp' src='" + imgpath + "' style='display: none;background:#ffffff'/>";
	
	var thisImgID = 'img#'+id+'-l';
	
	if ($(thisImgID).length > 0) // if the image has already been made... 
		$(thisImgID).remove();  //  delete it!  We'll make it again.  It will still be cached! 
	
	if (toggleChip)             // this convention causes a beautiful back and forth effect when loading the images
	{
		$(".current-lp").after(imgMarkup);   // create a new image with the proper source... the name .current-lp is confusing, it should be anchor-lp, and it's always invisible... so just anchor
		toggleChip = false;
	}
	else
	{
		$(".current-lp").before(imgMarkup);
		toggleChip = true;
	}
	
	changeSelectedButton(element);
	
	
	// Hide the text, then hide picture on callback.....................
	$("#lovely-description").fadeOut('100');
	$('.lovely-picture').hide('slow');   // on callback, show the next-lp
	
	$('.next-lp').show('slow', function (){
		// Then show the text in this callback.................................
		 changeParagraph(element);
  		 $("#lovely-description").slideDown();
	});
	
	$('.next-lp').removeClass('next-lp');
	$('.next-lp').addClass('current-lp');
}



function changeParagraph(element)
{
	var content = element.css('content');
        //alert('the content is ' + content);
        thisId = element.attr('id');
	//alert(content.length);
	if(typeof content == 'undefined'){
   		content = "none";  // ie...
   		content = contentXML[thisId];
                
   		// Do ajax and check if it's in the xml file
   		// There is a known bug in this, and that is that the first item you click, it will not have the content downloaded and ready yet.
   		// I find this to be a feature in that the the span text is somewhat important.  
 	};
 	if(content == ''){ // safari
 		content = "none";
 	};
 	
	
	if (content != "none")
		content = content.substring(1, content.length-1);  // trim it up
	else // content is still "none"
        {
                content = contentXML[thisId];

                if (typeof contentXML[thisId] == "undefined"){
		  content = "Why not stop by and speak with our paint & design experts?";   // Default paragraph
                }
        }	
	$("#lovely-description p").replaceWith("<p>" + content + "</p>");
}


function doAjaxRead()
{
	$.ajax({
		type: "GET",
		url: "/data/contents.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('content').each(function(){
				var id = $(this).attr('id');
				var string = $(this).find('string').text();
				
				//alert(string);
				//contentXML.push([id, string]);
				contentXML[id] = string;
                                //alert(contentXML.length);
				
				//$('<div class="items" id="link_'+id+'"></div>').html('<a href="'+url+'">'+title+'</a>').appendTo('#page-wrap');
				
			});
		}
	});
}



//******************** FILTER MENU STUFF, TAG RELATED *********************



function fltByTag(tag){ // used in submenu to change tag to display
	$('#submenus ul li').removeClass('hl-submenu');
	$('ul.hl li').each(function(){
		
		$(this).removeClass('hl-submenu');  // remove highlighting from all of the submenu buttons... but...
		
		// check through until you find the one you just clicked and set it's class to hl
		if ($(this).children().html()== tag)
			$(this).addClass('hl-submenu');
		
	});
	
	
	// lowerCaseAndReplaceSpaces(text)
	tag = tag.toLowerCase().replace(/ /g, '-');
	//alert(tag);
	
	detailsOfTag(tag);
	$("#iScroll").children().each(function(i){
		subTerms = $(this).children()//.attr('id');  //.attr('id');
		//alert(subTerms);
		changeDisplayed(subTerms);
		return false;
	});
	
	//setSubmenuHighlight();
}

function setSubmenuHighlight(){
	var wrds = $('ul.hl li').html();
	alert(wrds);
	$('ul.hl li').addClass('hl');
}

function showSubmenu(submenu){ // get rid of old menu
	// deal with submenu
	$('ul.hl').removeClass('hl');
	// deal with mainmenu
	$('li.hl').removeClass('hl');
	
	// in with new menu
	$('#flt-' + submenu).addClass('hl');
	// deal with main menu
	$('#mnu-' + submenu).addClass('hl');  // deal with main menu
	
	// If the submenu contains only one child, go ahead and click that child for the user...
	if ($('#flt-' + submenu).children().length == 1)
	{
		fltByTag(submenu);
		
		// manually change it to be highlighted submenu
		$('#flt-' + submenu).children().addClass('hl-submenu')
	}
}


