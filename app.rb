require 'bundler'
Bundler.require

require 'open-uri'

ONE_DAY = 86400

Dir['./lib/*'].each do |f|
  require f
end

configure :production do
  before do
    cache_control :public, max_age: ONE_DAY
  end
end

get '/' do
  @trucks = AvailableFoodTrucks.all.sort_by(&:distance_and_location)

  erb :index
end

get '/:name.css' do
  scss :"css/#{params[:name]}"
end

get '/font/fontello.*' do
  relative_path = request.path_info
  send_file(settings.views + relative_path)
end
