# Rain Gauge Code

## Files
The `Rain_Gauge/` folder contains the corresponding `.ino` file. The code is intended for an ATtiny85 which was programmed through the Arduino IDE.

## Code Key Points
 - Read when the reed switch is triggered using an interrupt
 - Debouncing functionality to minimise false readings
 - Evaluate the amount of rain fallen per day in mm
 - Evaluate the rain intensity in mm/h
 - Averaging function for better results
 - Send data to master on request