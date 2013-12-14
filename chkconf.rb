require 'rubygems'
require 'time'
require 'sinatra'
#require 'viewpoint'

#include Viewpoint::EWS
#conf_email = 'crlarge@benetech.org'
#Viewpoint::EWS::EWS.endpoint = 'https://pod51043.outlook.com/ews/Exchange.asmx'
#ExchAccount = File.read("/Users/gerardoc/Documents/PebbleFeed/exchcred.txt")
#Viewpoint::EWS::EWS.set_auth(ExchAccount.split("|")[0],ExchAccount.split("|")[1])

get '/' do
  #chkconf(conf_email)
  "2"
end

def chkconf(email)

	start_time = DateTime.parse("2013-12-13").iso8601
	end_time = DateTime.parse("2013-12-14").iso8601
	user_free_busy = Viewpoint::EWS::MailboxUser.get_user_availability(email,start_time,end_time)
    freebusy = user_free_busy[:free_busy_view][:merged_free_busy][:text]
    time = Time.now.hour() + (Time.now.min()/60)
	return freebusy[((time*6)).to_i]
	
end


