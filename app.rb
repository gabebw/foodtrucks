require 'bundler'
Bundler.require

require 'open-uri'

Dir['./lib/*'].each do |f|
  require f
end

get '/' do
  body = <<-EOS
  <pre>
Lunch trucks near Downtown Crossing:

#{FoodTruck.new.all}
</pre>
  EOS

  body
end
