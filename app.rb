require 'bundler'
Bundler.require

require 'open-uri'
require './lib/food_truck'

get '/' do
  <<-EOS
<pre>
Lunch trucks:
#{FoodTruck.new.all}
</pre>
  EOS
end
