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
  @trucks = AvailableFoodTrucks.all

  erb :index
end

get '/style.css' do
  send_file(settings.views + '/style.css', disposition: 'inline')
end
