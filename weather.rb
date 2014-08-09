require 'sinatra'
require 'yahoo_weatherman'

def get_weather(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location).condition['text']
end

get '/' do
	erb :home
end
post '/weather' do
 	@post = params[:post]['location']
 	@weather = get_weather(@post).downcase

 	"#{@weather}"

 	if(@weather == 'sunny')
 		erb :sunny
 	if(@weather == 'fair')
 		erb :sunny
 	elsif (@weather == 'cloudy')
 		erb :cloudy
 	elsif (@weather == 'mostly cloudy')
 		erb :cloudy
 	elsif (@weather == 'rainy')
 		erb :rainy
 	elsif (@weather == 'snowy')
 		erb :snowy
 	else
 		erb :default
 	end
end

