require 'sinatra'
require 'yahoo_weatherman'

def get_weather(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location).condition['text']
end

def get_temp(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location).condition['temp']
end

get '/' do
	erb :home
end
post '/weather' do
 	@post = params[:post]['location']
 	@weather = get_weather(@post).downcase
 	@temp = ((get_temp(@post) * 9)/5) + 32

 	"#{@weather}"

 	if(@weather == 'sunny')
 		erb :sunny
 	elsif(@weather == 'fair')
 		erb :sunny
 	elsif (@weather == 'cloudy')
 		erb :cloudy
 	elsif (@weather == 'mostly cloudy')
 		erb :cloudy
 	elsif (@weather == 'partly cloudy')
 		erb :cloudy
 	elsif (@weather == 'rainy')
 		erb :rainy
 	elsif (@weather == 'snowy')
 		erb :snowy
 	else
 		erb :default
 	end
end

#next steps
#add temp method and post data to view pages
#create div for temp and weather condition and center vertically on page
#stylize view for default page
#stylize H1
#stylize home page
