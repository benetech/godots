#!/usr/bin/env ruby
# encoding: utf-8

#require 'rubygems'
#require 'sinatra'
require 'time'
require 'viewpoint'

conf_email = 'crlarge@benetech.org'

include Viewpoint::EWS
Viewpoint::EWS::EWS.endpoint = 'https://pod51043.outlook.com/ews/Exchange.asmx'
ExchAccount = File.read("/Users/gerardoc/Documents/PebbleFeed/exchcred.txt")
Viewpoint::EWS::EWS.set_auth(ExchAccount.split("|")[0],ExchAccount.split("|")[1])

#get '/' do
  #chkconf(conf_email)
#  "2"
#end

def chkconf(email)
	#an improvement would be to only get availability for the current time and not the whole day
	#start_time = Time.now.iso8601 GC NOT WORKING
	#end_time = (Time.now + 7200).iso8601 GC NOT WORKING
	start_time = DateTime.parse(Time.now.year().to_s + "-" + Time.now.month().to_s + "-" + Time.now.day().to_s).iso8601
	end_time = DateTime.parse(Time.now.year().to_s + "-" + Time.now.month().to_s + "-" + (Time.now.day()+1).to_s).iso8601
	user_free_busy = Viewpoint::EWS::MailboxUser.get_user_availability(email,start_time,end_time)
    freebusy = user_free_busy[:free_busy_view][:merged_free_busy][:text]
    time = Time.now.hour() + (Time.now.min()/60)
	return freebusy[((time*6)).to_i]
end

puts chkconf(conf_email)


