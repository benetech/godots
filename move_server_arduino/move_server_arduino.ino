#include <SoftwareSerial.h>
#include <Servo.h>


Servo servoLeft;            // Declare left servo
int servoPosition;
byte incomingByte;

void setup()
{
 Serial.begin(9600);        // begin reading arduino's serial port
 servoLeft.attach(13);      // Attach servo to pin 13
 servoLeft.write(0);        //begin servo at 0 degrees
}

void loop() 
{ 

incomingByte = Serial.read();  //read serial port
servoPosition = servoLeft.read(); //read current servoPosition

if (servoPosition == incomingByte)
{
  //do nothing
}
else
{
  // change to incoming position
  servoPosition = incomingByte;
  servoLeft.write(servoPosition);
}
Serial.println(incomingByte, DEC);
delay(1000);
} 

