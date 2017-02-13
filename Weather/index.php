
<!DOCTYPE html>
<html>
<head>
  <title>Weather</title>

  <link rel="stylesheet" type="text/css" href="/css/styles.css">

  <script type="text/javascript" src="scripts.js"></script>
</head>
<body>

<div class="container">
  <div class="city-detail">
    <section class="city-header">
      <h4 id="current_time"></h4>
      <h2 id="city_name">San Jose</h2>
      <h4 id="current_weather"></h4>
      <h1 id="current_temp">49&deg;</h1>
    </section>

    <section class="today">
      <ul class="today-overview">
        <li id="current_day">Saturday</li>
        <li></li>
        <li id="current-high">62&deg;</li>
        <li id="current-low">46&deg;</li>
      </ul>

      <div class="today-hourly-list-container">
        <ul class="today-hourly-list" style="width: 1536px;">
          <li>
            <ul>
              <li>Now</li>
              
              <li class="hour_temp">47&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>9 AM</li>
              
              <li class="hour_temp">50&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>10 AM</li>
              
              <li class="hour_temp">53&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>11 AM</li>
              
              <li class="hour_temp">56&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>12 PM</li>
              
              <li class="hour_temp">58&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>1 PM</li>
              
              <li class="hour_temp">60&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>2 PM</li>
              
              <li class="hour_temp">62&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>3 PM</li>
              
              <li class="hour_temp">62&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>4 PM</li>
              
              <li class="hour_temp">62&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>5 PM</li>
              
              <li class="hour_temp">59&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>6 PM</li>
              
              <li class="hour_temp">56&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>7 PM</li>
              
              <li class="hour_temp">54&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>8 PM</li>
              
              <li class="hour_temp">53&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>9 PM</li>
              
              <li class="hour_temp">52&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>10 PM</li>
              
              <li class="hour_temp">51&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>11 PM</li>
              
              <li class="hour_temp">51&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>12 AM</li>
              
              <li class="hour_temp">50&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>1 AM</li>
              
              <li class="hour_temp">50&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>2 AM</li>
              
              <li class="hour_temp">50&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>3 AM</li>
              
              <li class="hour_temp">49&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>4 AM</li>
              
              <li class="hour_temp">48&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>5 AM</li>
              
              <li class="hour_temp">48&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>6 AM</li>
              
              <li class="hour_temp">48&deg;</li>
            </ul>
          </li>
          <li>
            <ul>
              <li>7 AM</li>
              
              <li class="hour_temp">48&deg;</li>
            </ul>
          </li>
        </ul>
      </div>
    </section>

    <section class="forecast">
      <ul class="forecast-list">
        <li>
          <ul>
            <li>Saturday</li>
            
            <li class = "expHigh">62&deg;</li>
            <li class = "expLow">46&deg;</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Sunday</li>
            
            <li class = "expHigh">58&deg;</li>
            <li class = "expLow">48&deg;</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Monday</li>
            
            <li class = "expHigh">58&deg;</li>
            <li class = "expLow">45&deg;</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Tuesday</li>
            
            <li class = "expHigh">58&deg;</li>
            <li class = "expLow">43&deg;</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Wednesday</li>
            
            <li class = "expHigh">63&deg;</li>
            <li class = "expLow">36&deg;</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Thursday</li>
            
            <li class = "expHigh">whatevs dude</li>
            <li class = "expLow">36&deg;</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Friday</li>
            
            <li class = "expHigh">63&deg;</li>
            <li class = "expLow">38&deg;</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Saturday</li>
            
            <li class = "expHigh">55&deg;</li>
            <li class = "expLow">43&deg;</li>
          </ul>
        </li>
      </ul>
    </section>

    <section class="today-details">
      <p class="today-summary">Today: Light rain on Saturday, with temperatures peaking at
      64&deg;F on Thursday.</p>

      <ul class="today-details-list">
        <li>
          <ul>
            <li>Sunrise:</li>
            <li id="dSunrise">7:23 AM</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Sunset:</li>
            <li id="dSunset">5:09 PM</li>
          </ul>
        </li>
        <li>
        </li>
        <li>
          <ul>
            <li>Chance of Rain:</li>
            <li id="dPrecipChc">0%</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Humidity:</li>
            <li id="dHumid">86%</li>
          </ul>
        </li>
        <li>
        </li>
        <li>
          <ul>
            <li>Wind:</li>
            <li id="wind">1 mph NW</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Feels like:</li>
            <li id="realFeel">49&deg;</li>
          </ul>
        </li>
        <li>
        </li>
        <li>
          <ul>
            <li>Precipitation:</li>
            <li id="dPrecipAct">--</li>
          </ul>
        </li>
        <li>
          <ul>
            <li>Pressure:</li>
            <li id="dPressure">30 in</li>
          </ul>
        </li>
        <li>
        </li>
        <li>
          <ul>
            <li>Visibility:</li>
            <li id="dVisib">9.42 mi</li>
          </ul>
        </li>
      </ul>
    </div>
  </section>
</div>

</body>
</html>
