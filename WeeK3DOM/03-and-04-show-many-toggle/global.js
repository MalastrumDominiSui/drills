window.addEventListener("load", function(){

  var hideButtons = document.getElementById("button");
  var hides = document.getElementsByClassName("hide_me");

	for (var i = 0; i < hides.length; i++){
    	hides[i].style.display = "none";
    }

	hideButtons.addEventListener("click", function(){
	  
	  for (var i = 0; i < hides.length; i++){
	    hides[i].style.display = "block";
	  }

      
	});

});
