#include <TinyWireS.h>

#define INTERRUPT_PIN PCINT1              // PB1
#define HALL_PIN PB1                      // Interrupt pin: PB1

#define I2C_SLAVE_ADDRESS 0x06            // Address of the slave

const int magnets = 4;                    // Number of pulses/magnets per revolution
int hall_count = 0;
float start_time;
float rps;
float omega;
const float radius = 0.04;                // Anemometer radius [m]
float v;
float past_v[25];                         // Array dimension must be equal to av_time
const int av_time = 25;                   // Average wind speed over this period of time [s]
float sum = 0;
float average_v;

volatile bool reading = 0;
volatile bool wait = 1;

byte bytes[4];

void setup()
{
    cli();                                // Disable interrupts during setup
    
    PCMSK |= (1 << INTERRUPT_PIN);        // Enable interrupt handler (ISR) for our chosen interrupt pin (PCINT1/PB1/pin 6)
    GIMSK |= (1 << PCIE);                 // Enable PCINT interrupt in the general interrupt mask
    pinMode(HALL_PIN, INPUT_PULLUP);      // Set our interrupt pin as input with a pullup to keep it stable
    
    // Timer configuration
    TCCR1 |= (1 << CTC1);                 // clear timer on compare match
    TCCR1 = 0x0F;                         //clock prescaler 16384 (CLK = 16 MHz => (16*10e6/16384)^-1 = 1.024 ms)
    OCR1C = 20;                           // compare match value (20.48 ms)
    TIMSK |= (1 << OCIE1A);               // enable compare match interrupt
    
    sei();                                // enable interrupts
    
    TinyWireS.begin(I2C_SLAVE_ADDRESS);   // join i2c network
    TinyWireS.onRequest(requestEvent);

    // Initialise past velocity array
    for (int n = 0; n < av_time; n++)
    {
      past_v[n] = 0.0;
    }

    start_time = millis();
}

void loop() 
{
  TinyWireS_stop_check();

  // Check wind speed every second
  if (millis() - start_time > 1000)
  {
    // Calculate wind speed
    rps = (hall_count / magnets);       // Revolution per second
    omega = rps * 2 * PI;               // Angular velocity [rad/s]
    v = omega * radius;                 // Wind velocity [m/s]

    // Push arry one position back and save the latest measuremnt in the last position
    sum = 0;
    for (int n = 0; n < av_time; n++)
    {
      if (n == (av_time - 1))
      {
        past_v[n] = v;
      }
      else
      {
        past_v[n] = past_v[n + 1];
      }

      sum = sum + past_v[n];
    }

    // Average array
    average_v = sum / av_time;

    // Reset counter
    hall_count = 0;

    start_time = millis();
  }
}

// Gets called when the ATtiny receives an i2c request
void requestEvent()
{   
    memcpy(&bytes, &average_v, 4);

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
  
  reading = 1;
}

ISR(TIMER1_COMPA_vect)
{
  // =========== 20 ms debouncing ===============
  if(reading == 1)
  {
    if(digitalRead(HALL_PIN) == LOW)  // Detects falling edge only
    {
      hall_count += 1;
    }
  }
  reading = 0;
}
