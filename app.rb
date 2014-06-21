require 'bundler'
Bundler.require

require 'open-uri'

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  available_trucks = AvailableFoodTrucks.all
  @pretty_printer = PrettyPrinter.new(available_trucks)

  erb :index
end
