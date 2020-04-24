var testData = '{"location":{"name":"Glasgow","region":"Glasgow City","country":"United Kingdom","lat":55.86,"lon":-4.25,"tz_id":"Europe/London","localtime_epoch":1583237814,"localtime":"2020-03-03 12:16"},"current":{"last_updated_epoch":1583237709,"last_updated":"2020-03-03 12:15","temp_c":7.0,"temp_f":44.6,"is_day":1,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png","code":1003},"wind_mph":11.9,"wind_kph":19.1,"wind_degree":270,"wind_dir":"W","pressure_mb":996.0,"pressure_in":29.9,"precip_mm":0.5,"precip_in":0.02,"humidity":87,"cloud":75,"feelslike_c":3.7,"feelslike_f":38.6,"vis_km":10.0,"vis_miles":6.0,"uv":3.0,"gust_mph":13.0,"gust_kph":20.9}}';


var obj = JSON.parse(testData);
document.getElementById("APIspeed").innerHTML = obj.current.wind_kph + "km/h";
//document.getElementById("APIdir").innerHTML = "<p>" + compass(obj.current.wind_degree) + " - " + obj.current.wind_degree + " degrees" + "</p>";
document.getElementById("APIsolar").innerHTML = obj.current.cloud + "%";
document.getElementById("APItemp").innerHTML = obj.current.temp_c + "°C";
document.getElementById("APIhum").innerHTML = obj.current.humidity + "%";
document.getElementById("APIrai").innerHTML = obj.current.precip_mm + "mm";
document.getElementById("APIair").innerHTML = obj.current.pressure_mb + "hPa";