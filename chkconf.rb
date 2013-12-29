#!/usr/bin/env ruby
# encoding: utf-8

require 'time'
require 'viewpoint'
require "serialport"

conf_email = 'crlarge@benetech.org'

include Viewpoint::EWS
Viewpoint::EWS::EWS.endpoint = 'https://pod51043.outlook.com/ews/Exchange.asmx'
ExchAccount = File.read("/home/pi/exchcred.txt")
Viewpoint::EWS::EWS.set_auth(ExchAccount.split("|")[0],ExchAccount.split("|")[1])

def chkconf(email)
	start_time = Time.now.iso8601.sub("-08","+00")
	end_time = (Time.now + 1800).iso8601.sub("-08","+00")
	user_free_busy = Viewpoint::EWS::MailboxUser.get_user_availability(email,start_time,end_time)
    freebusy = user_free_busy[:free_busy_view][:merged_free_busy][:text]
	return (freebusy[0,2]=="00") ? "free" : "busy"
end

def moveservo(position)
	sp = SerialPort.new("/dev/ttyACM0", 9600, 8, 1, SerialPort::NONE)
	while true do
		serialData = sp.gets
		if serialData
			i = serialData.chomp
			puts "data is #{i}"
			sp.write(position.chr)
			if i.to_i == position
				break
			end
		end
	end
	sp.close
end

if chkconf(conf_email) == 'free'
	moveservo(0)
else
	moveservo(180)
end


