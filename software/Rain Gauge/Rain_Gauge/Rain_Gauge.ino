#include <TinyWireS.h>

#define INTERRUPT_PIN PCINT1            // PB1
#define INT_PIN PB1                     // Interrupt pin of choice: PB1

#define I2C_SLAVE_ADDRESS 0x4           // Address of the slave

byte bytes[4];

volatile bool tilt = 0;
 
int tilts_counter = 0;
int past_1min_slots[10] = {0,0,0,0,0,0,0,0,0,0};  // Tilts per minute in the past 10 minutes
int one_min = 2930;  
int sum = 0;
float tilts_per_min = 0.0;
float mm_per_min = 0.0;
float mm_per_h = 0.0;
float daily_rain = 0.0;  // In mm

unsigned long start_time_min;
unsigned long start_time_day;
 
void setup()
{
    cli();                                // Disable interrupts during setup
    
    PCMSK |= (1 << INTERRUPT_PIN);        // Enable interrupt handler (ISR) for our chosen interrupt pin (PCINT1/PB1/pin 6)
    GIMSK |= (1 << PCIE);                 // Enable PCINT interrupt in the general interrupt mask
    pinMode(INT_PIN, INPUT_PULLUP);       // Set interrupt pin as input with a pullup to keep it stable
    
    // Timer configuration
    TCCR1 |= (1 << CTC1);                 // clear timer on compare match
    TCCR1 = 0x0F;                         //clock prescaler 16384 (CLK = 16 MHz => (16*10e6/16384)^-1 = 1.024 ms)
    OCR1C = 20;                           // compare match value (20.48 ms)
    TIMSK |= (1 << OCIE1A);               // enable compare match interrupt
    
    sei();                                // enable interrupts
    
    TinyWireS.begin(I2C_SLAVE_ADDRESS);   // join i2c network
    TinyWireS.onRequest(requestEvent);

    start_time_min = millis();
}
 
void loop()
{
    TinyWireS_stop_check();

    if(millis() - start_time_min >= 60000)
    {
      // Push back array by 1 element
      for(int n = 0; n < 9; n++)
      {
        past_1min_slots[n] = past_1min_slots[n + 1];
      }
      // Store tilts in the last array element
      past_1min_slots[9] = tilts_counter;
      // Update the daily amount
      daily_rain = daily_rain + (tilts_counter * 0.1);
      // Reset tilts counter
      tilts_counter = 0;
  
      sum = 0;
      for(int n = 0; n < 10; n++)
      {
        sum = sum + past_1min_slots[n];
      }
      tilts_per_min = sum / 10.0;         // Average tilts per minute
      mm_per_min = tilts_per_min * 0.1;
      mm_per_h = mm_per_min * 60.0;

      start_time_min = millis();
    }

    if(millis() - start_time_day >= 86400000)
    {
      daily_rain = 0;
      
      start_time_day = millis();
    }
}
 
// Gets called when the ATtiny receives an i2c request
void requestEvent()
{
  // Send mm/h
  memcpy(&bytes, &mm_per_h, 4);

  for(int n = 0; n < 4; n++)
  {
    TinyWireS.send(bytes[n]);
  }

  // Send daily amount
  memcpy(&bytes, &daily_rain, 4);

  for(int n = 0; n < 4; n++)
  {
    TinyWireS.send(bytes[n]);
  }
}

ISR(PCINT0_vect)
{
  // Reset compare register to ensure timer gets called after 20 ms
  OCR1C = 0;
  OCR1C = 20;
  
  tilt = 1;
}

ISR(TIMER1_COMPA_vect)
{
  // =========== 20 ms debouncing ===============
  if(tilt == 1)
  {
    if(digitalRead(INT_PIN) == LOW)  // Detects falling edge only
    {
      tilts_counter++;
    }
  }
  tilt = 0;
}
