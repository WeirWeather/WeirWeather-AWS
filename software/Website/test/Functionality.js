// AJAX data request
function Load_Doc(url) {
    var xhttp = new XMLHttpRequest(); //Create request object
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //Data(this);
            var myObj = JSON.parse(this.responseText);
            document.getElementById("data").innerHTML = myObj.datetime;
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
}

/*function Data(xhttp) { //xml/ xhttp
    document.getElementById("data").innerHTML = xhttp.responseText;
    //document.getElementById("data").innerHTML = this.getResponseHeader()
}*/

//_____________________________________________________________________________

// Load the Visualization API and the piechart package.
google.charts.load('current', { 'packages': ['corechart'] });

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);
    var jsonData = $.ajax({
        url: "database.php",
        dataType: "json",
        async: false
    }).responseText;

    // Create our data table out of JSON data loaded from server.
    var data = new google.visualization.DataTable(jsonData);

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, { width: 400, height: 240 });
}

//_____________________________________________________________________________

// AJAX data request
function Load() {
    var xhttp = new XMLHttpRequest(); //Create request object
    xhttp.onreadystatechange = function() { //check ready state of message request
        if (this.readyState == 4 && this.status == 200) { //Message request link established 
            Data(this); //Call data fucntion and pass variable 
            document.getElementById("Data").innerHTML = xhttp.responseText; //Return id variable of request
            document.getElementById("Time").innerHTML = this.responseText;
            this.responsetext = string(data);
        }
    };
    xhttp.open("GET", worldclockapi.com, true); //Open resieve asynchronous link to web API 
    xhttp.send(); //Send request to server
}

function Data(xhttp) { //xml/ xhttp
    document.getElementById("data").innerHTML = xhttp.responseText;
    document.getElementById("Time").innerHTML = xhttp.responseText;
    //document.getElementById("data").innerHTML = this.getResponseHeader()
}