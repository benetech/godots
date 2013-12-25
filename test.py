import serial
import sys

print('Connect to Arduino')
ser = serial.Serial('/dev/ttyACM0', 9600)
print('Arduino Connection Successful')

servoValue = int(sys.argv[1])

while int(ser.readline()) != servoValue:
	print(ser.readline())
	ser.write(chr(servoValue))
    
print('Done')
