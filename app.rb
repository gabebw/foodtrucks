require 'bundler'
Bundler.require

require 'open-uri'
require './lib/food_truck'
require './lib/human_location'

get '/' do
  body = <<-EOS
Lunch trucks near Downtown Crossing:

#{FoodTruck.new.all}
  EOS

  [200, {'Content-Type' => 'text/plain'}, body]
end
