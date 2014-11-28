require 'bundler'
Bundler.require

require "sinatra/reloader" if development?
require 'open-uri'
require 'yaml'

ROOT = File.dirname(__FILE__)

GEOCODER = Geokit::Geocoders::UsGeocoder

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  user_location = GEOCODER.geocode("302 Western Avenue, Cambridge MA")
  @trucks = AvailableFoodTrucks.all_for("boston", user_location).sort_by(&:distance_and_location)

  erb :index
end

get '/:name.css' do
  scss :"css/#{params[:name]}"
end

post '/location' do
  location = params[:location]
  user_location = GEOCODER.geocode(location)

  trucks = AvailableFoodTrucks.all_for("boston", user_location).sort_by(&:distance_and_location)

  trucks.map(&:distance_and_location).inspect
end

get '/font/fontello.*' do
  relative_path = request.path_info
  send_file(settings.views + relative_path)
end
