require 'bundler'
Bundler.require

require "sinatra/reloader" if development?
require 'open-uri'
require 'yaml'

ROOT = settings.root

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  @trucks = AvailableFoodTrucks.all_for("boston").sort_by(&:distance_and_location)

  erb :index
end

get '/:name.css' do
  scss :"css/#{params[:name]}"
end

get '/font/fontello.*' do
  relative_path = request.path_info
  send_file(settings.views + relative_path)
end
