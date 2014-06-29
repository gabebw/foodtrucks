require 'bundler'
Bundler.require

require 'open-uri'

ONE_DAY = 86400

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  cache_control :public, max_age: ONE_DAY

  @trucks = AvailableFoodTrucks.all

  erb :index
end

get '/style.css' do
  send_file(settings.views + '/style.css', disposition: 'inline')
end
