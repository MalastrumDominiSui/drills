

window.addEventListener("load", function(){

  var hideButtons = document.getElementById("button");
  var hides = document.getElementsByClassName("hide_me");

	for (var i = 0; i < hides.length; i++){
    	hides[i].style.display = "none";
    }

	hideButtons.addEventListener("click", function(){
	  if (hides[0].style.display == "block") {   // this is crude, but we are kind of flipping them all at once.
	  	for (var i = 0; i < hides.length; i++){
	    	hides[i].style.display = "none";
	  	}
	  } else {
	  	for (var i = 0; i < hides.length; i++){
	    	hides[i].style.display = "block";
	  	}
	  }

      
	});

});