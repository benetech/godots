import urllib2
import serial
import sys

print('Connecting...')
request = urllib2.Request("http://localhost:4567")
response = urllib2.urlopen(request)
html = response.read()
print('Connection Successful')
sys.stdout.write("Connection result = "  + html)
sys.stdout.flush()

print('Connect to Arduino')
ser = serial.Serial("/dev/ttyACM0", 9600)
print('Arduino Connection Successful')

print('sent message to arduino')
#Need to map resonse html to arduino input
while 1:
	print("looping")
	ser.write('SomeArduinoValue')

print('Done')
