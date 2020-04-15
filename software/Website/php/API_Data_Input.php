<?php

$host = "localhost";
$username = "root";
$user_pass = "root";
$database_in_use = "Weather_Data";


$mysqli = new mysqli($host, $username, $user_pass, $database_in_use);


if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "\n";

$dateTime = $_POST['dateTime'];
$windSpeed = $_POST['windSpeed'];
$windDirection = $_POST['windDirection'];
$solarRadiation = $_POST['solarRadiation'];
$temp = $_POST['temperature'];
$humidity = $_POST['humidity'];
$rainLevel = $_POST['rainLevel'];
$airPressure = $_POST['airPressure'];

$sql_str1 = "INSERT INTO Ext_API_Table (Date_Time";    #First half of sql querey for concatenation
$sql_str2 = ") VALUES (";   #Second half of sql querey for concatenation

#Use current date and time if no value specified
if (!$dateTime) {
    $sql_str2 .= "NOW()";
} else {
    $sql_str2 .= "'$dateTime'";
}

#If windSpeed posted, add it to SQL querey
if (!is_null($windSpeed)) {
    $sql_str1 .= ", Wind_Speed";
    $sql_str2 .= ", '$windSpeed'";
}

#If windDirection posted, add it to SQL querey
if (!is_null($windDirection)) {
    $sql_str1 .= ", Wind_Direction";
    $sql_str2 .= ", '$windDirection'";
}

#If solarRadiation posted, add it to SQL querey
if (!is_null($solarRadiation)) {
    $sql_str1 .= ", Solar_Radiation";
    $sql_str2 .= ", '$solarRadiation'";
}

#If temperature posted, add it to SQL querey
if (!is_null($temp)) {
    $sql_str1 .= ", Temperature";
    $sql_str2 .= ", '$temp'";
}

#If humidity posted, add it to SQL querey
if (!is_null($humidity)) {
    $sql_str1 .= ", Humidity";
    $sql_str2 .= ", '$humidity'";
}

#If rainLevel posted, add it to SQL querey
if (!is_null($rainLevel)) {
    $sql_str1 .= ", Rain_Level";
    $sql_str2 .= ", '$rainLevel'";
}

#If windSpeed posted, add it to SQL querey
if (!is_null($airPressure)) {
    $sql_str1 .= ", Air_Pressure";
    $sql_str2 .= ", '$airPressure'";
}

$sql_str2 .= ")";
$sql = $sql_str1 . $sql_str2;   #Bring sql strings together to form statement


$mysqli->query($sql);

?>