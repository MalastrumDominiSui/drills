window.addEventListener("load", function(){

	function showLike(){
		var like = document.getElementsByClassName("action--like")[0]
		like.style.display = "block";
	}

	var likeTitle = document.getElementsByClassName("likeTitle")[0];

	likeTitle.addEventListener("click", showLike);
});