require 'sinatra'
require './weather'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  weather = Weather.new(37.5483, -121.9875)
  weather.fetch
  weather.process_svg
  `rsvg-convert --background-color=white -o weather-script-output.png weather-script-output.svg`
  `pngcrush -c0 w4 weather-script-output.png weather-output.png`
  `cp -f weather-output.png ~/Sites/weather-script-output.png`
  `cp -f weather-output.png #{File.join(File.dirname(__FILE__) + "/public/weather-script-output.png")}`
  "Latest weather updated"
end
