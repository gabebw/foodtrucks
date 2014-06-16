require 'bundler'
Bundler.require

require 'open-uri'

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  body = <<-EOS
Lunch trucks near Downtown Crossing:

#{FoodTruck.new.all}
  EOS

  [200, {'Content-Type' => 'text/plain'}, body]
end
