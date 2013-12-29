#include <SoftwareSerial.h>
#include <Servo.h>


Servo servoLeft;            // Declare left servo
int servoPosition;
byte incomingByte;

void setup()
{
 Serial.begin(9600);        // begin reading arduino's serial port
 servoLeft.attach(11);      // Attach servo to pin 13
 servoLeft.write(0);        //begin servo at 0 degrees
}

void loop() 
{ 
incomingByte = int(Serial.read());  //read serial port
//incomingByte = 1;  //read serial port
//servoPosition = servoLeft.read(); //read current servoPosition
if (incomingByte != 255)
  servoPosition = incomingByte;

servoLeft.write(servoPosition);
Serial.println(servoPosition, DEC);
delay(1000);
} 

