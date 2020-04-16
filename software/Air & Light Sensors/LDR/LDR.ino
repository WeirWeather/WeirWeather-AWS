#include <TinyWireS.h>

#define I2C_SLAVE_ADDRESS 0x05          // Address of the slave

#define LDR_PIN PB1                     // LDR input pin

int ldr_value;
byte bytes[2];
int sum = 0;

void setup() 
{
  TinyWireS.begin(I2C_SLAVE_ADDRESS);   // join i2c network
  TinyWireS.onRequest(requestEvent);

  pinMode(LDR_PIN, INPUT);
}

void loop() 
{
  TinyWireS_stop_check();
  
  // Take an average over 10 samples
  sum = 0;
  for(int n = 0; n < 10; n++)
  {
    sum = sum + digitalRead(LDR_PIN);
    delay(10);
  }
  if(sum < 5)
  {
    ldr_value = 0;
  }
  else 
  {
    ldr_value = 1;
  }


}

// Gets called when the ATtiny receives an i2c request
void requestEvent()
{
    memcpy(&bytes, &ldr_value, 2);

    for(int n = 0; n < 2; n++)
    {
      TinyWireS.send(bytes[n]);
    }
}
