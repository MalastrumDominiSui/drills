window.addEventListener("load", function(){

  var moreLink = document.getElementsByClassName("click_more");
  	for (var i = 0; i < moreLink.length; i++){
  		moreLink[i].addEventListener("click", displayContent)
	}

  function displayContent(){
  		if (this.nextElementSibling.style.display == "inline") {
  			this.nextElementSibling.style.display = "none";
  		} else {
  			this.nextElementSibling.style.display = "inline";
  		}
  		
  }

});


// is there another way to do this, access elements more granularly, or elementarily? I could have grabbed an element perhaps by its ID, but this would be unique, whereas More is more likely to be a specific class of things on a page, which could have several more items.

//  Question 1 If you click the link to reveal more text and then refresh the page, 
// does the text remain revealed, or is it hidden again? Why?

// Answer: the text is in a persistant state in the HTML, whenever I load the page, because 
// the HTML file is saved such that display = "none" for the More span element, it will always load 
// with the display style being "none"

// Question 2:
// Answer: The window event listener action waits for all the elements of the window to load first.  If we tried to listen before the window fully loaded, it would not be able to listen to non-existent elements.  It also gives us the element "this" to operate on, which is extremely powerful in terms of creating dynamic reponsive content.

// Question 3: not sure what the lingo of "contract" is