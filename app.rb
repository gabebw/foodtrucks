require 'bundler'
Bundler.require

require 'open-uri'
require './lib/food_truck'
require './lib/human_location'

get '/' do
  <<-EOS
<pre>
Lunch trucks:
#{FoodTruck.new.all}
</pre>
  EOS
end
