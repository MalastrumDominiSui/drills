//TODO, account for exception handling when we get to the end of the list in either direction
//TODO, make the field activate when either clicked, or submitted via Enter button.

window.addEventListener("load", function(){
	//gather our needed DOM stuff
	var buttons = document.getElementsByClassName("button");
	var title = document.getElementById("title");
	var year = document.getElementById("year");
	var pic = document.getElementById("pic");
	var results = document.getElementById("numresults");
	//variables to hold place
	var currentSearch = "";
	var currentSearchNum = 0;
	var currentSearchTotal = 0;

	// function keepNumModularX(num, X){
	// 	return num%X;
	// }


	// shows previous and next buttons
	function hideAndSeek(event){
		buttons[1].style.display="inline";
		buttons[2].style.display="inline";
	}

	//get JSON movie info
	function getMovieJSON(num, pathStr){
		console.log(currentSearchNum);
		var ourRequest = new XMLHttpRequest;
		ourRequest.open("get","/results?query=" + pathStr);
		ourRequest.addEventListener("load", function(){
			var data = JSON.parse(ourRequest.responseText);
			currentSearchTotal = (data)["Search"].length;
			results.innerText = "Total search results:  " + (data)["Search"].length;
			title.innerText = (data)["Search"][num]["Title"];
			year.innerText = (data)["Search"][num]["Year"];
			pic.src = (data)["Search"][num]["Poster"];
		});	
		ourRequest.send();

	}

	// when we click search, do some stuff.
	buttons[0].addEventListener("click", function(){
		currentSearch = event.target.previousElementSibling.value;
		hideAndSeek(event);
		event.target.previousElementSibling.value = "";	
		getMovieJSON(0,currentSearch);
	});



	//listen to next button, go to next JSON with modular addition
	buttons[2].addEventListener("click", function(){
		if (currentSearchNum < currentSearchTotal-1) {
			currentSearchNum = currentSearchNum +1;
			getMovieJSON(currentSearchNum, currentSearch);
		} 
		// else {
		// 	currentSearchNum += 1;
		// 	currentSearchNum = keepNumModularX(currentSearchNum, currentSearchTotal);
		// 	getMovieJSON(currentSearchNum, currentSearch);
		// }
	});

	// listen to previous button, go to previous JSON with modular subtraction
	buttons[1].addEventListener("click", function(){
		if (currentSearchNum > 0) {
			currentSearchNum = currentSearchNum - 1;
			getMovieJSON(currentSearchNum, currentSearch);
		} 
		// else {
		// 	currentSearchNum = (currentSearchNum + currentSearchTotal - 1);
		// 	currentSearchNum = keepNumModularX(currentSearchNum, currentSearchTotal);
		// 	getMovieJSON(currentSearchNum, currentSearch);
		// }

	});
});