function buildPerson(aPersonData){
	var personHtml = "<ul>" +
		"<li>" + "Name: " + aPersonData["fname"] +" "+ aPersonData["lname"] + "</li>" + 
		"<li>" + "Phone: " + aPersonData["tel"] + "</li>" +
		"<li>" + "Address: " + aPersonData["address"] +"</li>" +
		"<li>" + "City: " + aPersonData["city"] +"</li>" +
		"<li>" + "State: " + aPersonData["state"] +"</li>" +
		"<li>" + "Zip: " + aPersonData["zip"] +"</li>" +
	"</ul>"

	return personHtml;
}

function buildAllPeople(peopleJson){
	var allPeople = ""
	for (var i = 0; i < peopleJson.length; i++) {
		allPeople += buildPerson(peopleJson[i]);
	}
	return allPeople
}

window.addEventListener("load", function(){
	//getting the body element, there is only 1
	var body = document.getElementsByTagName("body")[0]  

	//gettings JSON data from server.  I wish this data was formatted.
	var request = new XMLHttpRequest();
	request.open('GET',"/people")
	request.onload = function(){
		var thePeopleData = JSON.parse(request.responseText);
		body.innerHTML = buildAllPeople(thePeopleData);
	};
	request.send();
});