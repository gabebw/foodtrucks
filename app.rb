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
  # send_file(settings.views + "/css/#{params[:name]}.css")
end

get '/font/fontello.*' do
  extension = params[:splat].first
  path = settings.views + "/font/fontello.#{extension}"

  send_file(path)
end
