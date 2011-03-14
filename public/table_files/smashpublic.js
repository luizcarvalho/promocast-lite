/**
 * @package WordPress
 * @subpackage SmashingMagazine_Theme
 * @maintainer Robin Schulz <robin.schulz@smashing-media.com>
 */

/***
 * Select and highlight the subject passed by get-param
 * Example with subject: smashingmagazine.com/contact-us/?Books / Shop
 * Example with index: smashingmagazine.com/contact-us/?4
 */
function initSubjectHighlighting() {
	// if contact found in url, get query-param
	if(/\/contact?.+\//i.test(location.pathname)) {
		var getparam = (unescape(location.search).length>0)?unescape(location.search.split('?')[1]):'';
		// Check whether get-param was appended@url and highlight/select the subject 
		if(getparam !== '' && getparam !== 0) {
			// Is not numeric, match by subject
			if(isNaN(getparam)) {
				var inputEl = jQuery('input[value='+getparam+']');
				// If inputfield exist with get-param, select input and highlight label text
				if(inputEl.length>0) {
					inputEl.parent('label').html('<input type="radio" value="'+getparam+'" name="subject" class="radio" checked="checked"><span class="highlighted">'+getparam+'</span>');
				}
			// Is numeric, match by index-id
			}else{
				// Type-Conversion: string to integer
				var idx = parseFloat(getparam);
				// if index-number in range, select input and highlight label text
				if(idx >= 1 || idx < jQuery('.subject label').length) {
					var label = jQuery('.subject label').slice(idx,idx+1);
					var text = label.text();	
					label.html('<input type="radio" value="'+text+'" name="subject" class="radio" checked="checked"><span class="highlighted">'+text+'</span>');
				}
			}
			// Change-event to remove marker from highlighted textfield
			jQuery('.subject label input').change(function(e) {
				e.preventDefault();
				jQuery('.subject label span.highlighted').removeClass('highlighted');
			});
		}
	}
}