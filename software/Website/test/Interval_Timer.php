<html>

<head>

<title>Current Weather Data - Auto Refresh</title>

</head>


<body>

<h1>php echo Section</h1>

<div id="auto"></div>

<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#auto').load('Get_Current_Weather.php');
	refresh();
});

function refresh(){
	setTimeout( function() {
		$('#auto').load('Get_Current_Weather.php');
		refresh();
		}, 200);
		
}



</script>


<h1>JSON Section</h1>

<p id="jsonSection"></p>
<p id="temp"></p>

<script>
//Get data in JSON format
var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    var myObj = JSON.parse(this.responseText);
    document.getElementById("jsonSection").innerHTML = myObj.rainLevel;
    document.getElementById("temp").innerHTML = myObj.temperature;
  }
};
xmlhttp.open("GET", "Get_current_Weather.php", true);
xmlhttp.send();
</script>

<div>



</body>

</html>