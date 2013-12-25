#import urllib2
import serial
import sys

#print('Connecting...')
#request = urllib2.Request("http://localhost:4567")
#response = urllib2.urlopen(request)
#html = response.read()
#print('Connection Successful')
#sys.stdout.write("Connection result = "  + html)
#sys.stdout.flush()

print('Connect to Arduino')
ser = serial.Serial("/dev/cu.usbmodem1421", 9600)
print('Arduino Connection Successful')

print('sent message to arduino')
#Need to map resonse html to arduino input
#i = 0
while 1 == 1:
	i = 45;
	#print(i)
	ser.write(chr(i))
	print ser.read()

print('Done')
