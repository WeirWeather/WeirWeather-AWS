<?php

$host = "localhost";
$username = "root";
$user_pass = "root";
$database_in_use = "Weather_Data";


$mysqli = new mysqli($host, $username, $user_pass, $database_in_use);


if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
#echo $mysqli->host_info . "<br>";


$sql = "SELECT * FROM Weather_Data_Table ORDER BY Date_Time DESC LIMIT 1";
$result = $mysqli->query($sql);

$result = $result->fetch_assoc();

#Get the last updated time from the API Table
$sql2 = "SELECT * FROM Ext_API_Table ORDER BY Date_Time DESC LIMIT 1";
$result2 = $mysqli->query($sql2);

$result2 = $result2->fetch_assoc();

$dateTime = $result["Date_Time"];

$date = substr($dateTime, 0, 10);   #Get most current date in database
$dateLower = $date . " 00:00:00";   #Start of day
$dateUpper = $date . " 23:59:59";   #End of day

#Request to find all times from the current day where day light is present
$sqlDayLightHours = "SELECT Date_Time FROM Weather_Data_Table WHERE Date_Time >= '$dateLower' AND Date_Time <= '$dateUpper' AND Solar_Radiation > 0";

$resultsDLH = $mysqli->query($sqlDayLightHours);

$unixTimes = array();

#Parse all date/times recieved from request and convert to unix time
while ($row = mysqli_fetch_assoc($resultsDLH)){
    $unixTimes[] = array(
        strtotime($row["Date_Time"])
    );
}

$lowestTime = min($unixTimes);
$highestTime = max($unixTimes);

$difference = $highestTime[0] - $lowestTime[0]; #Calculate daylight hours

$dayLightHours = gmdate("H:i:s", $difference);    #Convert from unix time to hours, minutes and seconds

$currentWeatherData = array(
    "AWS_data" => array(
        "dateTime" => $result["Date_Time"],
        "windSpeed" => $result["Wind_Speed"],
        "windDirection" => $result["Wind_Direction"],
        "dayLightHours" => $dayLightHours,
        "temperature" => $result["Temperature"],
        "humidity" => $result["Humidity"],
        "rainLevel" => $result["Rain_Level"],
        "airPressure" => $result["Air_Pressure"],
        "bootCount" => $result["Boot_Count"]
    ),
    "Ext_API_data" => array(
        "dateTime" => $result2["Date_Time"],
        "windSpeed" => $result2["Wind_Speed"],
        "windDirection" => $result2["Wind_Direction"],
        #"solarRadiation" => $result2["Solar_Radiation"],
        "temperature" => $result2["Temperature"],
        "humidity" => $result2["Humidity"],
        "rainLevel" => $result2["Rain_Level"],
        "airPressure" => $result2["Air_Pressure"]
    )
);

echo json_encode($currentWeatherData);

#echo "Date & Time: " . $result["Date_Time"]. " || WS: " . $result["Wind_Speed"] . " || WD: " . $result["Wind_Direction"] . " || SR: " . $result["Solar_Radiation"] . " || T: " . $result["Temperature"]. " || H: " . $result["Humidity"] . " || RL: ". $result["Rain_Level"] . " || AP: " . $result["Air_Pressure"] . "<br>";

$mysqli->close();


?>