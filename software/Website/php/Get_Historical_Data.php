<?php

$host = "localhost";
$username = "root";
$user_pass = "root";
$database_in_use = "Weather_Data";


$mysqli = new mysqli($host, $username, $user_pass, $database_in_use);


if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

#Get Request parameter
$weatherType = $_GET['weatherType'];        #Weather Type must be specified in SQL format!
$table = $_GET['table'];                    #AWS or external API data

#SQL query
if ($table == "AWS") {
    $sql = "SELECT Date_Time, $weatherType FROM Weather_Data_Table ORDER BY Date_Time ASC";
} 
elseif ($table == "ExtAPI") {
    $sql = "SELECT Date_Time, $weatherType FROM Ext_API_Table ORDER BY Date_Time ASC";
}

$result = $mysqli->query($sql);


$historicalData = array();


while ($row = mysqli_fetch_assoc($result)){
    $historicalData[] = array(
        strtotime($row["Date_Time"])*1000,
        floatval($row[$weatherType]));
}


echo json_encode($historicalData);


$mysqli->close();


?>