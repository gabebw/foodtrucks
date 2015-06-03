require 'bundler'
Bundler.require

require 'open-uri'
require 'yaml'

ROOT = settings.root

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  @trucks = AvailableFoodTrucks.in("boston").sorted

  erb :index
end

get '/:name.css' do
  scss :"css/#{params[:name]}"
end

get '/font/fontello.*' do
  relative_path = request.path_info
  send_file(settings.views + relative_path)
end
