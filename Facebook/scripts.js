window.addEventListener("load", function(){
	var likes = document.getElementsByClassName("action--like");
	var unlikes = document.getElementsByClassName("action--unlike");

	for (var i = 0; i < unlikes.length; i++){
		unlikes[i].style.display = "none";
		likes[i].addEventListener("click", like);
		unlikes[i].addEventListener("click", unlike);
	}

	function addXlikestoString(likeAndCmtStr, num){
		likeAndCmtStr = likeAndCmtStr.split(" ");
		likeAndCmtStr[0] = (parseInt(likeAndCmtStr[0]) +num).toString();
		likeAndCmtStr = likeAndCmtStr.join(" ");
		return(likeAndCmtStr);
	}

	function likeNumCommentString(thees){  //these are just not legible in code
		return(thees.parentElement.parentElement.nextElementSibling.firstElementChild.getElementsByClassName('like_count')[0]);
	}

	function likeNumPostString(thees){  //to nervous to use "this"
		return(thees.parentElement.getElementsByClassName('like_count')[0]);
	}
	
	function like(){
		this.nextElementSibling.style.display = "inline";
		this.style.display = "none";

		if (likeNumPostString(this) != undefined ){
			likeNumPostString(this).innerText = addXlikestoString(likeNumPostString(this).innerText , 1);
		} else {
			likeNumCommentString(this).innerText = addXlikestoString(likeNumCommentString(this).innerText, 1);
		}
	}

	function unlike(){
		this.previousElementSibling.style.display = "inline";
		this.style.display = "none";

		if (likeNumPostString(this) != undefined ){
			likeNumPostString(this).innerText = addXlikestoString(likeNumPostString(this).innerText , -1);
		} else {
			likeNumCommentString(this).innerText = addXlikestoString(likeNumCommentString(this).innerText, -1);
		}
	}
});