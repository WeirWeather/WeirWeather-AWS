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
$bootCount = $_POST['bootCount'];


$sql_str1 = "INSERT INTO Weather_Data_Table (Date_Time";    #First half of sql querey for concatenation
$sql_str2 = ") VALUES (";   #Second half of sql querey for concatenation

#Use current date and time if no value specified
if (!$dateTime) {
    $sql_str2 .= "NOW()";
} else {
    $sql_str2 .= "'$dateTime'";
}

#If windSpeed posted and within given range, add it to SQL querey
 if (is_numeric($windSpeed)){
    if (($windSpeed >= 0) and ($windSpeed <= 100)){
        $sql_str1 .= ", Wind_Speed";
        $sql_str2 .= ", '$windSpeed'";
    }
}

#If windDirection posted and within given range, add it to SQL querey
if (is_numeric($windDirection)){
    if (($windDirection>=0) and ($windDirection<=360)) {
        $sql_str1 .= ", Wind_Direction";
        $sql_str2 .= ", '$windDirection'";
    }
}

#If solarRadiation posted and within given range add it to SQL querey
if (is_numeric($solarRadiation)){
    if (($solarRadiation>=0) and ($solarRadiation<=100)) {
        $sql_str1 .= ", Solar_Radiation";
        $sql_str2 .= ", '$solarRadiation'";
    }
}

#If temperature posted and within given range, add it to SQL querey
if (is_numeric($temp)){
    if (($temp>=-40) and ($temp<=50)) {
        $sql_str1 .= ", Temperature";
        $sql_str2 .= ", '$temp'";
    }
}

#If humidity posted and within given range, add it to SQL querey
if (is_numeric($humidity)){
    if (($humidity>=0) and ($humidity<=100)) {
        $sql_str1 .= ", Humidity";
        $sql_str2 .= ", '$humidity'";
    }
}

#If rainLevel posted and within given range, add it to SQL querey
if (is_numeric($rainLevel)){
    if (($rainLevel>=0) and ($rainLevel<=1850) ) {
        $sql_str1 .= ", Rain_Level";
        $sql_str2 .= ", '$rainLevel'";
    }
}

#If windSpeed posted, add it to SQL querey
if (is_numeric($airPressure)){
    if (($airPressure>=900) and ($airPressure<=1080)) {
        $sql_str1 .= ", Air_Pressure";
        $sql_str2 .= ", '$airPressure'";
    }
}

if (is_numeric($bootCount)){
    if (($bootCount>=0) and ($bootCount<=2147483647)) {
        $sql_str1 .= ", Boot_Count";
        $sql_str2 .= ", '$bootCount'";
    }
}

$sql_str2 .= ")";
$sql = $sql_str1 . $sql_str2;   #Bring sql strings together to form statement


$mysqli->query($sql);


#Make call to external API
$apiKey = ""; # *Your API key from WeatherAPI*
$APIrequest = json_decode(CallAPI("GET", "http://api.weatherapi.com/v1/current.json?key=" . $apiKey . "&q=Glasgow"), true);
$windSpeed = round($APIrequest["current"]["wind_kph"] * 0.2777778, 2);
$windDirection = $APIrequest["current"]["wind_degree"];
$solarRadiation = $APIrequest["current"]["cloud"];
$temperature = $APIrequest["current"]["temp_c"];
$humidity = $APIrequest["current"]["humidity"];
$rainLevel = $APIrequest["current"]["precip_mm"];
$airPressure = $APIrequest["current"]["pressure_mb"];

$sql = "INSERT INTO Ext_API_Table (Date_Time, Wind_Speed, Wind_Direction, Solar_Radiation, Temperature, Humidity, Rain_Level, Air_Pressure) VALUES (NOW(), '$windSpeed', '$windDirection', '$solarRadiation', '$temperature', '$humidity', '$rainLevel', '$airPressure')";

$mysqli->query($sql);

function CallAPI($method, $url, $data = false)
{
    $curl = curl_init();

    switch ($method)
    {
        case "POST":
            curl_setopt($curl, CURLOPT_POST, 1);

            if ($data)
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        case "PUT":
            curl_setopt($curl, CURLOPT_PUT, 1);
            break;
        default:
            if ($data)
                $url = sprintf("%s?%s", $url, http_build_query($data));
    }

    // Optional Authentication:
    curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
    curl_setopt($curl, CURLOPT_USERPWD, "username:password");

    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

    $result = curl_exec($curl);

    curl_close($curl);

    return $result;
}

?>
