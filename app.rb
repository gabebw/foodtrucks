require 'bundler'
Bundler.require

require 'open-uri'
require 'yaml'

DATA_DIRECTORY = File.join(settings.root, "data")

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  @trucks = AllFoodTrucks.all_for("boston").
    select(&:available?).
    sort_by(&:distance_and_location)

  erb :index
end

get '/:name.css' do
  scss :"css/#{params[:name]}"
end

get '/font/fontello.*' do
  relative_path = request.path_info
  send_file(settings.views + relative_path)
end

get '/api/boston.json' do
  @trucks = AllFoodTrucks.all_for("boston").
    sort_by(&:distance_and_location)

  @trucks.inspect
end
