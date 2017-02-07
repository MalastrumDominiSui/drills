window.addEventListener("load", function(){

  var button = document.getElementById('button');

  button.addEventListener("click", function() {

    var divs_to_hide = document.getElementsByClassName('hide_me');

    for (var i = 0; i < divs_to_hide.length; i++) {
      divs_to_hide[i].style.display = "none";
    }
  });

});

// my solution was identical to his except for one thing, I defined my divs to hide originally on top of my
//button.EventListener function, I suppose this makes sense since I never use that variable here except inside
// the scope of button.addEventListener