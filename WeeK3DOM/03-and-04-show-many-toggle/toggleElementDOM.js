window.addEventListener("load", function(){

	var button = document.getElementById("toggle_button");
	var movies = document.getElementsByClassName("movies");
	var firstfive = document.getElementsByClassName("first_five");
	var secondfive = document.querySelectorAll("ul.second_five");

	// for (var i = 0; i < hides.length; i++){
 //    	hides[i].style.display = "none";
 //    }
 	debugger;
	button.addEventListener("click", function(){
	  if (secondfive[0].style.display == "") {   // this is crude, but we are kind of flipping them all at once.
	    	secondfive[0].style.display = "none";
	  } else {
	    	secondfive[0].style.display = "block";
	  }

      
	});

});