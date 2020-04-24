#include <SoftwareSerial.h>
#include <Wire.h>
#include <RTClibExtended.h>
#include <LowPower.h>
#include <avr/sleep.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BME280.h>
#include <Wire.h>
#include "Seeed_SHT35.h"
#include <Dps310.h>

#define DEBUG 1                                   // Comment to exclude debug code to be uploaded
// Sensor Variables
// Rain Gauge
uint8_t rain_gauge_ADDR = 0x04;                   // Rain gauge slave I2C address
float mm_per_h = 0.0;                             // Rain intensity [mm/h]
float daily_rain = 0.0;                           // Daily rain ammount [mm]

// TMP117
const int TMP117_Address = 0x48;
const int Temp_Reg = 0x00;
double temp;

// SHT35
SHT35 sensor(21, 0x44);
float tempH, hum;

// DPS310
Dps310 Dps310PressureSensor = Dps310();
float pressure;
uint8_t oversampling = 7;
int16_t ret;

// LDR
const int LDR_Address = 0x05;
byte bytes[2];
int ldr_value;

int AS5600_ADR = 0x36;
const int raw_ang_hi = 0x0c;
const int raw_ang_lo = 0x0d;
const int ang_hi = 0x0e;
const int ang_lo = 0x0f;
const int stat = 0x0b;
const int agc = 0x1a;
const int mag_hi = 0x1b;
const int mag_lo = 0x1c;
float Ang;

// Comms and DAQ Variables
#define DS3231_I2C_ADDRESS 0x68
Adafruit_BME280 bme; // I2C
RTC_DS3231 RTC;      //sing the DS3231 RTC
SoftwareSerial gprs(7,8);
byte goToSleepNow = 1;
int ledPin = 13;
byte ledStatus = 1;
int baud = 19200;
int count = 0;
byte s,m,h,d,mo,ms;
int y;
String msg;
String timeString;
int mins = 2;
int minCount = 1;
String data = "";
int rstCount = 0;
bool lock = 0;
int period_mins = 

void flushGPRS()
{
  while(gprs.available())
  {
    char msg = gprs.read();
  }
}

void toSerial()
{
  flushGPRS();
  delay(10);
  flushGPRS();
}

void sendGPRS2(char* msg, int delayMs = 400)
{
    flushGPRS();
    gprs.println(msg);
    delay(delayMs);
    while (gprs.available())
    {
      data += gprs.readString();
    }
    delay(10);
    while (gprs.available())
    {
      data += gprs.readString();
    }
    flushGPRS();
    if((!(data.indexOf("1,200") >= 0)) && rstCount < 4)
    {
      data = "";
      rstCount += 1;
      connectGPRS();
      getRTCTime();
      readDataWW();
      sendPost();
    }
    else
    {
      data = "";
      rstCount = 0; 
      return;
    }
}

void sendGPRS(char* msg, int delayMs = 400)
{
  gprs.println(msg);
  toSerial();
  delay(delayMs);
  toSerial();
}

void wakeupGPRS()
{
  flushGPRS();
  delay(10);
  gprs.println("AT");
  gprs.println("AT+CSCLK=0");
  delay(100);
  flushGPRS();
}

void connectGPRS()
{
  // Set up GPRS Connection
  sendGPRS("AT+SAPBR=3,1,\"Contype\",\"GPRS\"");
  // Set the APN
  sendGPRS("AT+SAPBR=3,1,\"APN\",\"everywhere\"");
  // Enable GPRS
  sendGPRS("AT+SAPBR=1,1",750);
  sendGPRS("AT+SAPBR=2,1",750);
  delay(50);
  toSerial();
}

void readDataWW()
{
  msg += "dateTime=";
  msg += y;  msg += '-';
  if(mo<10) {msg += '0';}
  msg += mo; msg += '-';
  if(d<10)  {msg += '0';}
  msg += d;  msg += " ";
 
  if(h<10)  {msg += '0';}
  msg += h;  msg += ':';
  if(m<10)  {msg += '0';}
  msg += m;  msg += ':';
  if(s<10)  {msg += '0';}
  
  msg += s;  msg += '&';
  
  // Read and Store Sensor Values
  readRainGauge();
  ReadTempSensor();
  readHumidity();
  readPressure();
  readLDR();
  readWindVane();
  

  msg += "temperature=";
  msg += temp;
  msg += "&";
  msg += "humidity=";
  msg += hum;
  msg += "&";
  msg += "airPressure=";
  msg +=  pressure;
  msg += "&";
  msg += "windDirection=";
  msg +=  Ang-3;
  msg += "&";
  msg += "windSpeed=";
  msg += windSpeed;
  msg += "&";
  msg += "solarRadiation=";
  msg +=  ldr_value;
  msg += "&";
  msg += "rainLevel=";
  msg +=  mm_per_h;
  
  
  // Testing values 
  /*
  msg += "temperature=";
  msg += bme.readTemperature();
  msg += "&";
  msg += "humidity=";
  msg += bme.readHumidity();
  msg += "&";
  msg += "airPressure=";
  msg += bme.readPressure() / 100.0F;
  msg += "&";
  msg += "windDirection=270&";
  msg += "windSpeed=10&";
  msg += "solarRadiation=1&";
  msg += "rainLevel=7";*/
  
  msg += "&bootCount=";
  msg += count;
  delay(10);
}

void sendPost()
{
   delay(100);
   // Initialize HTTP Service
   sendGPRS("AT+HTTPINIT");
   // Set URL to POST Data to
   sendGPRS("AT+HTTPPARA=\"CID\",1");
   sendGPRS("AT+HTTPPARA=\"URL\",\"http://82.27.165.48/Weir-Weather/php/Data_Input.php\"",750);
   toSerial();
   sendGPRS("AT+HTTPPARA=\"CONTENT\",\"application/x-www-form-urlencoded\"",750);
   // Set Data Length & Max Send Time in ms
   sendGPRS("AT+HTTPDATA=155,1000");
   // Send Data
   flushGPRS();
   char c[msg.length()+1];
   strcpy(c,msg.c_str());
   sendGPRS(c,1000);
   msg = "";
   // Send HTTP POST Request
   flushGPRS();
   sendGPRS2("AT+HTTPACTION=1",4000);
   sendGPRS("AT+HTTPREAD",1250);
   sendGPRS("AT+HTTPTERM",300);
}

void closeGPRS()
{ 
  sendGPRS("AT+SAPBR=0,1",750);
  delay(50);
  toSerial();
}

void readAndTransmitData()
{
  connectGPRS();
  getRTCTime();
  readDataWW();
  sendPost();
  count++;
}

void getRTCTime()
{
  DateTime time = RTC.now();
  h = time.hour();
  m = time.minute();
  s = time.second();
  d = time.day();
  mo = time.month();
  y = time.year();
}

void startComms()
{
  Wire.begin();
  gprs.begin(baud);
  bme.begin(0x76);
  RTC.begin();
  delay(50);
}

void wakeUp()        // here the interrupt is handled after wakeup
{
  if(!lock)
  {
    delay(5);
    detachInterrupt(0);
    sleep_disable();
    delay(5);
  }
}

void readRainGauge()
{
  byte bytes_mmph[4] = {0,0,0,0};
  byte bytes_daily[4] = {0,0,0,0};
  
  Wire.requestFrom(rain_gauge_ADDR, 8);           // request 8 bytes from slave device address
 
  while(Wire.available())
  {
    // Receive mm/h
    for(int n = 0; n < 4; n++)
    {
      bytes_mmph[n] = Wire.read();                // receive a byte as character
    }

    // Receive daily amount
    for(int n = 0; n < 4; n++)
    {
      bytes_daily[n] = Wire.read();
    }
  }

  // Convert bytes into floats
  memcpy(&mm_per_h, &bytes_mmph, 4);              
  memcpy(&daily_rain, &bytes_daily, 4);
}

double ReadTempSensor()
{
  // Data array to store 2-bytes from I2C line
  uint8_t data[2];
  //  Combination of 2-byte data into 16-bit data
  uint16_t datac;

  // Points to device and begins transmission
  Wire.beginTransmission(TMP117_Address);
  // Points to temperature register to read/write data
  Wire.write(Temp_Reg);
  // Ends data transfer and transmits data from register
  Wire.endTransmission();

  // Dealy to allow sufficient conversion time
  delayMillis(10);

  // Request 2-bite temperature from device
  Wire.requestFrom(TMP117_Address, 2);

  // Check if the data received matches the requested 2-bytes
  if(Wire.available() <= 2)
  {
    // Store each byte of data from temperature register
    data[0] = Wire.read();
    data[1] = Wire.read();

    // Combine data to make 16-bit binary number
    datac = ((data[0] << 8) | data[1]);

    // Convert to Celcius (7.8125 mC resolution) and return
    return datac * 0.0078125;
  }
}

void readHumidity()
{
  u16 value = 0;
  u8 data[6] = {0};
  if (NO_ERROR != sensor.read_meas_data_single_shot(HIGH_REP_WITH_STRCH, &tempH, &hum)) {
      #ifdef DEBUG
      Serial.println("read temp failed!");
      Serial.println("   ");
      Serial.println("   ");
      Serial.println("   ");
      #endif
  }
}
void readPressure()
{
  ret = Dps310PressureSensor.measurePressureOnce(pressure, oversampling);
  if (ret != 0)
  {
    #ifdef DEBUG
    //Something went wrong.
    //Look at the library code for more information about return codes
    Serial.print("FAIL! ret = ");
    Serial.println(ret);
    #endif
  }
}

void readLDR()
{
  Wire.requestFrom(LDR_Address, 2);  // request 2 bytes from slave device address 5

  while(Wire.available()) // slave may send less than requested
  {
    for(int n = 0; n < 2; n++)
    {
      bytes[n] = Wire.read(); // receive a byte as character
    }
  }
  memcpy(&ldr_value, &bytes, 2);
}


void readWindVane()
{
  // Read Raw Angle Low Byte
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(raw_ang_lo);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   int lo_raw = Wire.read();
   // Read Raw Angle High Byte
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(raw_ang_hi);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   word hi_raw = Wire.read();
   hi_raw = hi_raw << 8; //shift raw angle hi 8 left
   hi_raw = hi_raw | lo_raw; //AND high and low raw angle value
   //**********************************************************
   // Read Angle Low Byte
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(ang_lo);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   int lo_ang = Wire.read();
   //Read Angle High Byte
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(ang_hi);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   word hi_ang = Wire.read();
   hi_ang = hi_ang << 8;
   hi_ang = hi_ang | lo_ang;
   //**************************************************
   //Read Magnitude High Byte
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(mag_hi);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   word hi_mag = Wire.read();
   //Read Magnitude Low Byte
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(mag_lo);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   word lo_mag = Wire.read();
   hi_mag = hi_mag << 8;
   hi_mag = hi_mag | lo_mag;
   //**************************************************
   //Read AGC
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(agc);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   int agc_val = Wire.read();
   //***************************************************
   // Read Status Bits
   Wire.beginTransmission(AS5600_ADR);
   Wire.write(stat);
   Wire.endTransmission();
   Wire.requestFrom(AS5600_ADR, 1);
   while(Wire.available() == 0);
   int stat_val = Wire.read();
   stat_val = stat_val & 0xa0; //Mask off all unnecessary bits
   Ang = hi_ang * 0.0879;
}
// Function to replace delay()
void delayMillis(uint32_t ms)
{
  uint32_t start_time = millis();

  while(1)
  {
    if((millis() - start_time) > ms)
    {
      return;
    }
  }
}

void sleepMCU()
{
  delay(10);
  attachInterrupt(0, wakeUp, FALLING);
  RTC.setAlarm(ALM1_MATCH_SECONDS, 0, 0, 0, 0);
  RTC.alarmInterrupt(1, true); //set alarm1
  digitalWrite(9,LOW);
  lock = 0;
  delay(1000);
  LowPower.powerDown(SLEEP_FOREVER, ADC_OFF, BOD_OFF); 

  // Continue only every 'period_mins' minutes
  // Return every other minute
  if(minCount == period_mins){minCount = 1;}
  else{minCount++; return;}
  lock = 1;
  delay(50);
  digitalWrite(9,HIGH);
  delay(30000);
  startComms();
  readAndTransmitData();
  delay(50);
}

void setup() {
  // Begin Serial & I2C Communication
  startComms();
  //RTC.adjust(DateTime(__DATE__, __TIME__));
  // Set up RTC Alarm Every Minute & Interrupt Pin
  RTC.armAlarm(1, false);
  RTC.clearAlarm(1);
  RTC.alarmInterrupt(1, false);
  RTC.writeSqwPinMode(DS3231_OFF);
  RTC.setAlarm(ALM1_MATCH_SECONDS, 0, 0, 0, 0);
  RTC.alarmInterrupt(1, true); // Set RTC alarm1
  pinMode(2,INPUT_PULLUP); // Enable interrupt pin
  pinMode(9,OUTPUT); // Enable digital output
  digitalWrite(9,LOW); // Enable Verter output
}

void loop() {sleepMCU();}
