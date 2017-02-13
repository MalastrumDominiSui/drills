//collect all our elements
window.addEventListener( "load", function(){

var timeNode = document.getElementById("current_time");
var cTempNode = document.getElementById("current_temp");
var cSummaryNode = document.getElementById("current_weather");
var cDayNode = document.getElementById("current_day");
var cHigh = document.getElementById("current-high");
var cLow = document.getElementById("current-low");
var hourlyTempNodes = document.getElementsByClassName("hour_temp");
var vSummaryNode = document.getElementsByClassName("today-summary")[0];  //there is only one anyway

var expHighTemps = document.getElementsByClassName("expHigh");
var expLowTemps = document.getElementsByClassName("expLow");

var dRiseNode = document.getElementById("dSunrise")

var dSetNode =document.getElementById("dSunset")

var rChanceNode =document.getElementById("dPrecipChc")
var humidNode = document.getElementById("dHumid")
var windNode = document.getElementById("wind")
var feelsNode =document.getElementById("realFeel")
var precipNode = document.getElementById("dPrecipAct")
var pressNode = document.getElementById("dPressure")
var visibNode = document.getElementById("dVisib")



// this function will take en Epoch and return the corresponding Day of the Week
function getDayfromEpoch(epo){
	var timestamp = epo;
	var a = new Date(timestamp*1000);
	var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
	var dayOfWeek = days[a.getDay()];
	return dayOfWeek;	
}

//does what it says.  format includes seconds
function getTimefromEpoch(epo){
	var timestamp = epo;
	var a = new Date(timestamp*1000);
	a = a.toLocaleTimeString();
	return a;
}

// takes 3 digit degree and returns the direction of the wind
function degToCompass(num) {
    var val = Math.floor((num / 22.5) + 0.5);
    var arr = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
    return arr[(val % 16)];
}

//beginning the changes to the html based on JSON data
var ourRequest = new XMLHttpRequest();
ourRequest.open('GET', 'api');
ourRequest.onload = function() {
	var theData = JSON.parse(ourRequest.responseText);

	var myDate = new Date(theData["currently"]["time"]*1000);
	timeNode.innerText = myDate;

	cTempNode.innerText = Math.round(theData["currently"]["temperature"]) + "\xB0";

	cSummaryNode.innerText = theData["currently"]["summary"];

	cDayNode.innerText = getDayfromEpoch(theData["currently"]["time"]);

	cHigh.innerText = Math.round(theData["daily"]["data"][0]["apparentTemperatureMax"]) + "\xB0";

	cLow.innerText = Math.round(theData["daily"]["data"][0]["apparentTemperatureMin"])+ "\xB0";

	for (var i = 0; i<hourlyTempNodes.length; i++){
		hourlyTempNodes[i].innerText = Math.round(theData["hourly"]["data"][i]["temperature"])+ "\xB0";
	}

	for (var i = 0; i < expHighTemps.length; i++) {
		expHighTemps[i].innerText = Math.round(theData["daily"]["data"][i]["temperatureMax"])+"\xB0";
	}

	for (var i = 0; i < expLowTemps.length; i++) {
		expLowTemps[i].innerText = Math.round(theData["daily"]["data"][i]["temperatureMin"])+"\xB0";
	}

	vSummaryNode.innerText = theData["daily"]["summary"];

	dRiseNode.innerText = getTimefromEpoch(theData["daily"]["data"][0]["sunriseTime"]);
	dSetNode.innerText = getTimefromEpoch(theData["daily"]["data"][0]["sunsetTime"]);
	rChanceNode.innerText = Math.round(theData["daily"]["data"][0]["precipProbability"]*100) + "\%";
	humidNode.innerText = Math.round(theData["daily"]["data"][0]["humidity"]*100)+ "\%";
	windNode.innerText = theData["daily"]["data"][0]["windSpeed"] + "mph " + degToCompass(theData["daily"]["data"][0]["windBearing"]);
	feelsNode.innerText = theData["currently"]["apparentTemperature"]+"\xB0";
	precipNode.innerText = theData["daily"]["data"][0]["precipIntensity"];
	pressNode.innerText = Math.round(theData["daily"]["data"][0]["pressure"]*0.0295301) + " in";
	visibNode.innerText = theData["daily"]["data"][0]["visibility"] + " mi";



};

ourRequest.send();



});