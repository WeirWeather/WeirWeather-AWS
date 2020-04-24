var data = '{ "dateTime": "2020-01-22 20:02:00", "windSpeed": "1000", "windDirection": "5", "solarRadiation": "10.85", "temperature": "5.57", "humidity": "23.45", "rainLevel": "24", "airPressure": "1020.23" }'
var obj = JSON.parse(data);
document.getElementById("APItime").innerHTML = obj.dateTime;
document.getElementById("APIspeed").innerHTML = obj.windSpeed;
document.getElementById("APIdir").innerHTML = obj.windDirection;
document.getElementById("APIsolar").innerHTML = obj.solarRadiation;
document.getElementById("APItemp").innerHTML = obj.temperature;
document.getElementById("AIhum").innerHTML = obj.humidity;
document.getElementById("APIrai").innerHTML = obj.rainLevel;
document.getElementById("APIair").innerHTML = obj.airPressure;
    
var time = obj.dateTime;
document.getElementById("Time").innerHTML = "<p>" + time + "</p>";