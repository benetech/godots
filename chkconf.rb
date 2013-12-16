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
	start_time = Time.now.iso8601.sub("-08","+00")
	end_time = (Time.now + 1800).iso8601.sub("-08","+00")
	user_free_busy = Viewpoint::EWS::MailboxUser.get_user_availability(email,start_time,end_time)
    freebusy = user_free_busy[:free_busy_view][:merged_free_busy][:text]
	return (freebusy[0,2]=="00") ? "free" : "busy"
end

puts chkconf(conf_email)


