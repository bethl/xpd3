
var boxcount = 1;  // we need this global variable to track the number of boxes

function additems(){ 
	
	if (boxcount > 5) {    // uhoh, you're not supposed to add TOO many boxes
		alert('the idea of a news blast is to relay short bursts of information so please try to use just 5 boxes, or write it in the blog.');
		return;
	}
	
	
	
	boxcount++; // increment the counter
      
	// create a new box

	var index = boxcount-1;
	
	var divOpen = '<div class="field" id="dyn_' + index + '">';
	var box = '<input id="dyn_' + index + '" name="dyn[' + index + ']" size="30" type="text" /> ';
	var divClose = '</div>';
	
	$("#inputBottom")
		.before(divOpen + box + divClose);

};

function remitems(){ 
	
	if (boxcount == 1){return;}
	
	
	var index = boxcount-1;
	
	$("#dyn_"+index).remove();
	
	boxcount--;
};
