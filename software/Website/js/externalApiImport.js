var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        var obj = JSON.parse(this.responseText);
        if (isEmpty(obj)) {
            console.error("no data being received")
        }

        //document.getElementById("APItime").innerHTML = obj.;
        document.getElementById("APIspeed").innerHTML = (obj.current.wind_kph*0.2777778).toFixed(2) + "m/s";
        document.getElementById("APIdir").innerHTML = "<p>" + compass(obj.current.wind_degree) + " - " + obj.current.wind_degree + " degrees" + "</p>";
        //document.getElementById("APIsolar").innerHTML = obj.current.cloud + "%";
        document.getElementById("APItemp").innerHTML = obj.current.temp_c + "°C";
        document.getElementById("APIhum").innerHTML = obj.current.humidity + "%";
        document.getElementById("APIrai").innerHTML = obj.current.precip_mm + "mm";
        document.getElementById("APIair").innerHTML = obj.current.pressure_mb + "hPa";

        postData(obj);
        //document.getElementById("Time1").innerHTML = "<strong>" + obj.dateTime + "</strong>";

    }
    if (this.readyState == 4 && this.status == 403) {
        console.log("No data");
    }
    if (this.readyState == 4 && this.status == 404) {
        console.log("Not found");
    }
};
apiKey = "" // *Your API key from WeatherAPI*
xmlhttp.open("GET", "http://api.weatherapi.com/v1/current.json?key=" + apiKey + "=Glasgow", true);
xmlhttp.send();


//Send API data to API database
function postData(obj) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        document.getElementById("demo").innerHTML = this.responseText;
        }
    };
    xhttp.open("POST", "./php/API_Data_Input.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("temperature=" + obj.current.temp_c + "&windSpeed=" + obj.current.wind_kph*0.2777778 + "&windDirection=" + obj.current.wind_degree + "&solarRadiation=" + obj.current.cloud + "&humidity=" + obj.current.humidity + "&rainLevel=" + obj.current.precip_mm + "&airPressure=" + obj.current.pressure_mb);
}

//API_key = "6e5fb12f032f436789593149202401"
//request = "http://api.weatherapi.com/v1/current.json?key=%s&q=Glasgow" 


function compass(dir) {
    if (dir <= 11.25) {
        return "N";
    }
    if (dir > 11.25 && dir <= 33.75) {
        return "NNE";
    }
    if (dir > 33.75 && dir <= 56.25) {
        return "NE";
    }
    if (dir > 56.25 && dir <= 78.75) {
        return "ENE";
    }
    if (dir > 78.75 && dir <= 101.25) {
        return "E";
    }
    if (dir > 101.25 && dir <= 123.75) {
        return "ESE";
    }
    if (dir > 123.75 && dir <= 146.25) {
        return "SE";
    }
    if (dir > 146.25 && dir <= 168.75) {
        return "SSE";
    }
    if (dir > 168.75 && dir <= 191.25) {
        return "S";
    }
    if (dir > 191.25 && dir <= 213.75) {
        return "SSW";
    }
    if (dir > 213.75 && dir <= 236.25) {
        return "SW";
    }
    if (dir > 236.25 && dir <= 258.75) {
        return "WSW";
    }
    if (dir > 258.75 && dir <= 281.25) {
        return "W";
    }
    if (dir > 281.25 && dir <= 303.75) {
        return "WNW";
    }
    if (dir > 303.75 && dir <= 326.25) {
        return "NW";
    }
    if (dir > 326.25 && dir <= 348.75) {
        return "NNW";
    }
    if (dir > 348.75) {
        return "N";
    }
}