<html>

<head>

<script type="text/javascript">

function loadref(time){
	setTimeout("location.reload(true);",time);
}

</script>

</head>


<body onload="Javascript:loadref(5000)">


<?php

$host = "localhost";
$username = "root";
$user_pass = "root";
$database_in_use = "Weather_Data";


$mysqli = new mysqli($host, $username, $user_pass, $database_in_use);


if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "<br>";


$sql = "SELECT * FROM Weather_Data_Table";
$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Date & Time: " . $row["Date_Time"]. " || WS: " . $row["Wind_Speed"] . " || WD: " . $row["Wind_Direction"] . " || SR: " . $row["Solar_Radiation"] . " || T: " . $row["Temperature"]. " || H: " . $row["Humidity"] . " || RL: ". $row["Rain_Level"] . " || AP: " . $row["Air_Pressure"] . "<br>";
    }
} else {
    echo "0 results";
}
$mysqli->close();


?>


</body>




</html>